class Kelurahan < ActiveRecord::Base
  belongs_to :kecamatan

  has_many :tps, foreign_key: "kelurahan_id", class_name: "Tps"
  has_many :rekapitulasis, as: :entity
end
