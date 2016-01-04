class CreateTps < ActiveRecord::Migration
  def change
    create_table :tps do |t|
      t.references  :kelurahan
      t.string  :nama
    end
    add_index :tps, :kelurahan_id
  end
end
