class CreateRakapitulasis < ActiveRecord::Migration
  def change
    create_table :rekapitulasis do |t|
      t.references :entity, polymorphic: true, index: true
      t.string  :pemilih
      t.string  :pengguna_hak_pilih
      t.string  :perolehan_suara_1
      t.string  :perolehan_suara_2
      t.string  :suara_sah
      t.string  :suara_tidak_sah
      t.string  :total_suara
      t.string  :data_masuk
    end
  end
end
