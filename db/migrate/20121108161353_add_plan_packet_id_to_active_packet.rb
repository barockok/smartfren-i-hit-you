class AddPlanPacketIdToActivePacket < ActiveRecord::Migration
  def change
    add_column :active_packets, :plan_packet_id , :integer
  end
end
