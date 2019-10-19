class Link < ApplicationRecord
  belongs_to :link_page

  attribute :url, :url

  def formatted_link
  end
end
