class User < ActiveRecord::Base  
  has_many :leads
end