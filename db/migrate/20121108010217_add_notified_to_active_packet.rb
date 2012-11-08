class AddNotifiedToActivePacket < ActiveRecord::Migration
  def change
    add_column :active_packets , :notified , :boolean , :default => false
  end
end
