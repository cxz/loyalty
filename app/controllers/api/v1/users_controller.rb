class Api::V1::UsersController < Api::ApiController

class User < ::User
    def as_json(options = {})
      super.as_json(only: ['username', 'email', 'points'])
    end
  end

  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def add_points
    u = User.find(params[:id])
    u.points += params[:amount].to_d

    if u.save
      head :ok
    else
      render json: u.errors, status: :unprocessable_entity
    end
  end

end