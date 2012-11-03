class CreateActivePackets < ActiveRecord::Migration
  def change
    create_table :active_packets do |t|
      t.integer :nomor_id
      t.string :code
      t.timestamp :will_expired
      t.boolean :expired , {:default => false}
      t.timestamps
    end
  end
end
