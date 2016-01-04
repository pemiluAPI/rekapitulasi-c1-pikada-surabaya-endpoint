class CreateKelurahans < ActiveRecord::Migration
  def change
    create_table :kelurahans do |t|
      t.references :kecamatan
      t.string  :nama
    end
    add_index :kelurahans, :kecamatan_id
  end
end
