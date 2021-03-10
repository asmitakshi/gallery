class ApplicationController < ActionController::Base
  #before_action :require_no_authentication, only: :new
  def after_sign_in_path_for(resources)
    albums_path
  end
  end
