class Tps < ActiveRecord::Base
  belongs_to :kelurahan

  has_many :rekapitulasis, as: :entity
end
