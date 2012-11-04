class ClientNumber < ActiveRecord::Base
  attr_accessible :nomer, :password
  has_many :active_packet , :conditions => "expired == f", :order => "order_id DESC"
  has_one :plan_packet , :conditions => "archive == f", :order => "order_id DESC"
end
