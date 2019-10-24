class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:visit]

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

  # TODO: Remove the ability to edit or update a link
  def edit
  end

  def update
  end

  def destroy
    # TODO: Before action to find the links
    link = Link.find(params[:id])
    link.delete
    redirect_to link_page_path(link.link_page)
  end

  def visit
    link = Link.find(params[:id])

    if link
      redirect_to LinkService.visit(link)
    else
      render '404'
    end
  end

  private

    def link_params
      params
        .require(:link)
        .permit(:name, :url)
    end
end
