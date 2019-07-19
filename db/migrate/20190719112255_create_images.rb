class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :filename
      t.string :memo
      t.binary :photo

      t.timestamps
    end
  end
end
