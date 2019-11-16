class PagesController < ApplicationController
  def home
    redirect_to profile_path if current_user
  end

  def not_found
  end

  def profile
  end

  def link_page
    @link_page = LinkPage.find_by(slug: params[:slug])
    render "link_page", layout: "link_page"
  end
end
