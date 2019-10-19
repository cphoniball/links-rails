class LinkPagesController < ApplicationController
  def index
    @link_pages = LinkPage.all
  end

  def show
    @link_page = LinkPage.find(params[:id])
    @link = @link_page.links.build
  end

  def new
    @link_page = LinkPage.new
  end

  def create
    link_page = LinkPage.new(link_page_params)
    # TODO: Set the user based on the currently authenticated user after authentication is added
    link_page.user = User.find(1)

    if link_page.save
      redirect_to link_pages_path
    else
      render 'new'
    end
  end

  def edit
    @link_page = LinkPage.find(params[:id])
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
end
