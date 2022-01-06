class CreateWhales < ActiveRecord::Migration[6.1]
  def change
    create_table :whales do |t|
      t.string :name
      t.string :profile
      t.integer :rating

      t.timestamps
    end
  end
end
