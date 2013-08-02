class Giftcard < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'

  def redeem! user
    Giftcard.transaction do
      user.points += self.value
      self.owner = user
      self.save!
      user.save!
    end
  end

  def redeemed?
    !self.owner_id.nil?
  end

end
