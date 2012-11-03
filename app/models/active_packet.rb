class ActivePacket < ActiveRecord::Base
  attr_accessible :code, :expired, :nomor_id, :will_expired
  belongs_to :nomor
end
