class CreatePlanPakets < ActiveRecord::Migration
  def change
    create_table :plan_pakets do |t|
      t.integer :nomor_id
      t.string :code
      t.boolean :archive , {:default => false}
      t.string :status, {:defalt => 'inactive'}
      t.timestamps
    end
  end
end
