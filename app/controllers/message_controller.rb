class MessageController < WebsocketRails::BaseController
  def new_message
    Rails.logger.info "#{message}"
    #from = User.find(message[:from_id])
    #from.send_message(message[:body], message[:to_id])
    GroupMessage.create(username: message[:username], body: message[:body])
    WebsocketRails[:messages].trigger(:new_message, message)
  end

  def android_test
    Rails.logger.info "#{message}"
    Test.create(os_type: 0, message: message[:message], batch: message[:batch])
    count = Test.where(batch: message[:batch], os_type: 0).count
    data = { count: count, batch: message[:batch] }
    WebsocketRails[:tests].trigger(:android, data)
  end

  def ios_test
    Rails.logger.info "#{message}"
    Test.create(os_type: 1, message: message[:message], batch: message[:batch])
    count = Test.where(batch: message[:batch], os_type: 1).count
    data = { count: count, batch: message[:batch] }
    WebsocketRails[:tests].trigger(:ios, data)
  end
end
