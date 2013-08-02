class Api::ApiController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :restrict_access

  #api calls should not interfere with devise's trackable, etc
  before_action :skip_trackable

  rescue_from Exception do |e|
    if Rails.env.production?
      msg = ''
    else
      msg = e.inspect
    end
    render json: msg, status: :internal_server_error
  end

  private

  def restrict_access
    authenticate_or_request_with_http_basic do |token, ignored|
      @current_user ||= User.where(:authentication_token => token).first
    end

    @current_user ||= User.where(:authentication_token => params[:auth_token]).first

    head :unauthorized unless @current_user
  end

  def admin_only
    head :unauthorized unless @current_user.try(:admin)
  end



  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end

end