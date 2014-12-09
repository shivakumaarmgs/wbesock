class ApplicationAPI < Grape::API
  format :json

  get "hi" do
    "Hi HI"
  end

  mount V1::Base

end
