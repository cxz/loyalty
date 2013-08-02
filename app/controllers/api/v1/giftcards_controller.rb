class Api::V1::GiftcardsController < Api::ApiController

  before_action :admin_only, :only => [:index]

  respond_to :json

  def index
    respond_with Giftcard.all
  end

  def show
    respond_with Giftcard.where(:code => params[:id])
  end

  def redeem
    gc = Giftcard.where(:code => params[:id]).first

    if gc and !gc.redeemed?
      gc.redeem! @current_user
      head :ok

    else
      #either non existent or already redeemed.
      head :forbidden
    end

  end

end