class FriendshipsController < ApplicationController
  def new
    friendship=Friendship.new
  end
  def create
    @friendship=Friendship.new(friendship_params)
	if @friendship.save
	  redirect_to :back
	  #redirect_to user_path(@friendship.user_id) 
	end
  end
  def update
    @friendship=Friendship.find(params[:id])
	if @friendship.update(friendship_params)
	  redirect_to :back
	  #redirect_to user_path(@friendship.friend_id)
	end
  end
  def destroy
    @friendship=Friendship.find(params[:id])
	@temp=@friendship.friend_id
	@friendship.destroy
	#redirect_to root_path
	#redirect_to user_path(@temp)
	redirect_to :back
	
  end

   def messageSearch
     @user=current_user
	  @friendship=Friendship.find(params[:id])
	  if @friendship.friend_id==@user.id
	    @friend=User.find(@friendship.user_id)
	  else
	    @friend=User.find(@friendship.friend_id)
	  end
	  
	  @messages=Message.all
	  #@s=Message.searchMessages(@user,@friend)
	  #@message=@user.sent_messages.new(search_message_params)
	  @u=[]
	  @f=[]
	  @messages=Message.all
      @messages.each do |message|
         if message.sender_id==@friend.id && message.recipient_id==@user.id
           @u<<message
         end
		 if message.recipient_id==@friend.id && message.sender_id==@user.id
           @f<<message
         end
      end
	  #@friend=User.find(@message.recipient_id)
	  @temp=@friend.id
   end
  
  private 
    def friendship_params
	  params.require(:friendship).permit(:user_id,:friend_id,:status)
	end
end
