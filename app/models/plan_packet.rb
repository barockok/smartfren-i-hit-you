class PlanPacket < ActiveRecord::Base
  attr_accessible :code, :nomor_id, :will_subscribe_at, :archive
  belongs_to :client_number
end
