class CreateSlcsps < ActiveRecord::Migration[5.1]
  def change
    create_table :slcsps do |t|
      t.string :zipcode, null: false
      t.string :rate

      t.timestamps
    end
  end
end
