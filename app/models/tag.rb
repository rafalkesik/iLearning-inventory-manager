class Tag < ApplicationRecord
  has_many :inventory_tags
  has_many :inventories, through: :inventory_tags

  validates :title, presence: true, uniqueness: { case_sensitive: false },
                    length: { maximum: TITLE_MAX_LENGTH }
end