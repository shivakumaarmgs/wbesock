module V1
  class MessageAPI < ApplicationAPI

    get 'messages' do
      Message.all.limit(20)
    end
  end
end
