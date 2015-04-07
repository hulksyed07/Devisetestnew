class Message < ActiveRecord::Base
 belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
 belongs_to :sender, class_name: "User", foreign_key: "sender_id"

 
  def self.searchMessages(user,friend)
	   @f=[]
	   @messages=Message.all
       @messages.each do |message|
         if message.sender_id==user.id && message.recipient_id==friend.id
           @f<<message
         end
       end
       return @f	   
  end

end
