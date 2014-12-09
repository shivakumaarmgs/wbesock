module V1
  class Base < ApplicationAPI
    version "v1", :using => :path

    mount MessageAPI 

    get "cool" do
      "Cool Cool"
    end

  end
end
