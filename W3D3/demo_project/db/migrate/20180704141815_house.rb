class House < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :address
      t.timestamps
    end
  end
end
