class Conversation < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, :scope => :recipient_id
  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =? ) OR (conversations.sender_id = ? AND conversations.recipient_id = ? )", sender_id, recipient_id, recipient_id, sender_id)
  end
  def find_unread_messages(current_user)
    if self.sender_id == current_user.id
      other_user = self.recipient_id
    else
      other_user = self.sender_id
    end
    all_messages = Message.where(conversation_id: self.id, user_id:other_user, read: false)
    count = all_messages.count()
  end
  def self.find_all_unread_messages(current_user)
  a = 0
  Conversation.where(sender_id: current_user.id).or(Conversation.where(recipient_id: current_user.id)).each do |convo|
    a += convo.find_unread_messages(current_user)
  end
  return a
  end
end
