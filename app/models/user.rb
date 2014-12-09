class User < ActiveRecord::Base
  has_many :sent_messages, foreign_key: 'from_id', class_name: "Message"
  has_many :received_messages, foreign_key: 'to_id', class_name: "Message"

  def send_message(message, user_id)
    self.sent_messages.create(body: message, to_id: user_id)
  end
end
