class User < ActiveRecord::Base

  # Include default devise modules. Others available are: :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  before_save :ensure_authentication_token

  has_many :giftcards, :foreign_key => :owner_id
  belongs_to :company

  def name
    self.username
  end


end