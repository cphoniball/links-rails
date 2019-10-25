class LinkPage < ApplicationRecord
  belongs_to :user
  has_many :links, -> { extending Persisted }
  has_many :link_visits, through: :links

  # TODO: Use the attributes API to set the slug instead of a hook
  before_save :set_slug

  def visit_count
    link_visits.count
  end

  private

    def set_slug
      if slug.empty?
        self.slug = name.parameterize
      end
    end
end
