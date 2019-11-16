class Link < ApplicationRecord
  belongs_to :link_page
  has_many :link_visits

  attribute :id, :integer
  attribute :name, :string
  attribute :url, :url

  def formatted_link
  end

  def visit_count
    link_visits.count
  end
end
