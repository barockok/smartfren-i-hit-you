class PlanPacket < ActiveRecord::Base
  attr_accessible :code, :client_number_id, :will_subscribe_at, :archive
  belongs_to :client_number
  has_one :active_packet 
  def self.check_apply
    current_time = Time.now
    PlanPacket.where('will_subscribe_at < :current_time or will_subscribe_at = :current_time', {:current_time => current_time})
    .each do |pp|
      pp.update_attribute(:archive , true ) if pp.apply
    end
  end
  def apply
    ActivePacket.create(self.as_json(:only => [:code, :client_number_id]).merge({:plan_packet_id => id, :code => code , :will_expired => client_number.api.info[:expired_at] }) ) if client_number.buy(code)
  end
end
