class AddNomorIdToClientNumberIdToActivePacketsAndPlanPackets < ActiveRecord::Migration
  def change
    rename_column :active_packets , :nomor_id , :client_number_id
    rename_column :plan_packets , :nomor_id , :client_number_id
  end
end
