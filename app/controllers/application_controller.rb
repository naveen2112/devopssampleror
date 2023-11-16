class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_student!

  protected

  def current_user
    @current_user ||= current_student
  end
end
