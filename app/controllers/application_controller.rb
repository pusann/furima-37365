class ApplicationController < ActionController::Base
  before_action :basic_suth

  private
  def basic_auth
    authenticate_or_request_with_thhp_basic do  |username, password|
    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  end
end
