class CreateNomors < ActiveRecord::Migration
  def change
    create_table :nomors do |t|
      t.string :nomer
      t.string :password
      t.boolean :auto_subscribe , {:default  => true}
      t.string :default_package
      t.timestamps
    end
  end
end
