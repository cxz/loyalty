class RemoveRedeemedFromGiftcard < ActiveRecord::Migration
  def change
    remove_column :giftcards, :redeemed
  end
end
