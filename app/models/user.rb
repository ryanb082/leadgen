class User < ActiveRecord::Base  
  
  has_many :leads

  has_secure_password
end