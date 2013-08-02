class CreateGiftcards < ActiveRecord::Migration
  def change
    create_table :giftcards do |t|
      t.string :code, :null => false
      t.references :owner
      t.boolean :redeemed, :default => false
      t.decimal :value, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
