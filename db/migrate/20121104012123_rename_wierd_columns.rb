class RenameWierdColumns < ActiveRecord::Migration
  def change
    rename_table :nomors , :client_numbers
    rename_table :plan_pakets , :plan_packets
    
    #added will_subscribe_at to plan_packets
    add_column :plan_packets , :will_subscribe_at , :timestamp
  end
end
