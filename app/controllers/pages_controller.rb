class PagesController < ApplicationController
  load_and_authorize_resource except: :show

  skip_before_filter :authenticate_admin_user!,  only: [:show]
  skip_before_filter :check_authorization, only: [:show]

  def index
    @landing_page = Page.find(1)
  end

  def show
    redirect_to resources_path and return if request.path == root_path && current_user
    @public = true
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new page_params

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      flash.now[:alert] = @page.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      flash.now[:alert] = @page.errors.full_messages.to_sentence
      render action: 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'page was successfully destroyed.'
  end

  def add_tag
    tag = Tag.find params[:tag_id]
    @page.tags << tag
    head :no_content
  end

  def remove_tag
    @page.tags.find(params[:tag_id]).destroy
  end

  private

  def page_params
    params.require(:page).permit(:title, :content, :sort)
  end
end
