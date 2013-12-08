class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  check_authorization unless: :admin_or_devise_controller?

  before_filter :authenticate_user!
  before_filter :fetch_tags_by_category

  private

  def fetch_tags_by_category
    @tags_by_category = Tag.all.group_by(&:category)
  end

  def authenticate_admin_user!
    authenticate_user!
    redirect_to root_url, alert: 'You cannot access that resource' unless current_user.admin
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def admin_or_devise_controller?
    self.kind_of?(ActiveAdmin::BaseController) || devise_controller?
  end
end
