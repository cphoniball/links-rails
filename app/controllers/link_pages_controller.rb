class LinkPagesController < ApplicationController
  before_action :authenticate_user!

  before_action :find_link_page, only: [:show, :edit]
  before_action :authorize_user, only: [:show, :edit]

  def index
    @link_pages = LinkPage.where(user: current_user)
  end

  def show
    @link = @link_page.links.build
  end

  def new
    @link_page = LinkPage.new
  end

  def create
    @link_page = LinkPage.new(link_page_params)
    @link_page.user = current_user

    if @link_page.save
      redirect_to link_pages_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def link_page_params
      params
        .require(:link_page)
        .permit(:name, :slug)
    end

    def find_link_page
      @link_page = LinkPage.find(params[:id])
    end

    def authorize_user
      redirect_to link_pages_path unless @link_page.user == current_user
    end
end
