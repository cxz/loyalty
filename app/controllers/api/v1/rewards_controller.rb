class Api::V1::RewardsController < Api::ApiController

  class Reward < ::Reward
    def as_json(options = {})
      super.as_json(only: ['id', 'name', 'price'])
    end
  end

  respond_to :json

  def index
    respond_with Reward.all
  end

  def show
    respond_with Reward.find(params[:id])
  end

end