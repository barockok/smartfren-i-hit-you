class PlanPaket < ActiveRecord::Base
  attr_accessible :code, :nomor_id
  belongs_to :nomor
end
