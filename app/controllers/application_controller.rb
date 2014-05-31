class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  check_authorization unless: :authorized_controller?

  before_filter :authenticate_admin_user!
  before_filter :fetch_tags_by_category
  before_filter :fetch_pages

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  private

  def fetch_pages
    @pages = Page.all.reject {|p| p.id == 1 }
  end

  def fetch_tags_by_category
    @tags_by_category = Tag.includes(:tag_category).group_by(&:tag_category)
  end

  def authenticate_admin_user!
    authenticate_user!
    if current_user && !current_user.admin?
      sign_out
      redirect_to root_url, alert: 'You cannot access that resource'
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def authorized_controller?
    self.kind_of?(ActiveAdmin::BaseController) || devise_controller?  || self.kind_of?(PagesController)
  end
end
