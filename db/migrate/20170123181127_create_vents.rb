class CreateVents < ActiveRecord::Migration[5.0]
  def change
    create_table :vents do |t|
      t.text :text, null: false, limit: 500

      t.timestamps
    end
  end
end
