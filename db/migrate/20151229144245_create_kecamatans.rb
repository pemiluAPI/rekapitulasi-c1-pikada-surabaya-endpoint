class CreateKecamatans < ActiveRecord::Migration
  def change
    create_table :kecamatans do |t|
      t.string  :nama
    end
  end
end
