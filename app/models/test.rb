class Test < ActiveRecord::Base
  enum os_type: [:android, :ios]
end
