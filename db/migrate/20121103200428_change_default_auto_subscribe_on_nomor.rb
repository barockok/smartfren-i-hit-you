class ChangeDefaultAutoSubscribeOnNomor < ActiveRecord::Migration
  def change
    change_column :nomors , :auto_subscribe , :boolean, :default => false
  end
end
