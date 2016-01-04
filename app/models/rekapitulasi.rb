class Rekapitulasi < ActiveRecord::Base
  belongs_to :entity, polymorphic: true
end
