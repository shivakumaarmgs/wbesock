class MessageController < WebsocketRails::BaseController
  def new_message
    Rails.logger.info "#{message}"
    from = User.find(message[:from_id])
    from.send_message(message[:body], message[:to_id])
    WebsocketRails[:messages].trigger(:new_message, message)
  end
end
