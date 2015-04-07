class MessagesController < ApplicationController
  #before_action :set_recipient, only: [:new, :create]
  
  def new
   
      @messages=Message.all
      @user=current_user
	  @message=@user.messages.new(message_params)
	  #@testmessage={}
	  #@testmessage["sender_id"]=@message.sender_id
	  #@testmessage["recipient_id"]=@message.recipient_id
      #@message = current_user.sent_messages.new
   end

   def create
      @user=current_user
	  @message=@user.sent_messages.new(message_params)
	  @users=User.all
	  
	  
	  @friend=User.find(@message.recipient_id)
	  		
	  #@message1=@friend.messages.new(message1_params)
	  #@message=@user.messages.create(message_params)
	  @message.save
	  #@message1.save
	  #render "messages/search"
	  
	  redirect_to :back
      #@message = current_user.sent_messages.new message_params
      #@message.recipient_id = @recipient.id
      #@message.save
   end
   
   def search
      @user=current_user
	  @friendship=Friendship.find(params[:friendship_id])
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
	  #render 'search'
   end
   
   

   def index
      @messages = Message.all
   end

   def destroy
      @message = current_user.messages.destroy params[:id]
   end

   def show
      @messages=Message.all
      #@message = current_user.messages.find params[:id]
   end

   private
   
   def search_message_params
      params.require(:message).permit( :recipient_id)
   end

   def message_params
      params.require(:message).permit(:body, :recipient_id,:sender_id)
   end
   #def message1_params
   #   params.require(:message).permit(:body, :sender_id)
   #end

   def set_recipient
       @recipient = User.find params[:user_id]
   end
   
   
end
