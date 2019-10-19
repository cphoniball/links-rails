class LinksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    link = Link.new(link_params)
    link.link_page = LinkPage.find(params[:link_page_id])
    link.save

   # TODO: Add validation errors
    redirect_to link_page_path(link.link_page)
  end

  def edit
  end

  def update
  end

  def destroy
    link = Link.find(params[:id])
    link.delete
    redirect_to link_page_path(link.link_page)
  end

  private

    def link_params
      params
        .require(:link)
        .permit(:name, :url)
    end
end
