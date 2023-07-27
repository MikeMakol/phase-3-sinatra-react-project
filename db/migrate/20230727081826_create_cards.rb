class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.integer :card_number
      t.string :card_holder_name
      t.integer :expiry_date_month
      t.integer :expiry_date_year
      t.integer :cvv 
      t.belongs_to :user
      t.timestamps
    end
  end
end
