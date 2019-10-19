class LinkPage < ApplicationRecord
  belongs_to :user
  has_many :links, -> { extending Persisted }

  before_save :set_slug

  private

    def set_slug
      if slug.empty?
        self.slug = name.parameterize
      end
    end
end
