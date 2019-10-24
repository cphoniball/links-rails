class PagesController < ApplicationController
  def home
  end

  def not_found
  end

  def link_page
    @link_page = LinkPage.find_by(slug: params[:slug])
  end
end
