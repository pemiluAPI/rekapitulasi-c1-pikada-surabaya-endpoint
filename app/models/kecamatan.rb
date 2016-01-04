class Kecamatan < ActiveRecord::Base
 has_many :kelurahans
 has_many :rekapitulasis, as: :entity
end
