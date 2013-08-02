class Api::V1::StatsController < Api::ApiController

  respond_to :json

  def index
    render json: User.select(:id, :username, :points).order('points desc')
  end

end