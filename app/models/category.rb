class Category < ApplicationRecord
  has_many :inventories

  validates :title, presence: true, length: { maximum: TITLE_MAX_LENGTH },
                    uniqueness: { case_sensitive: false }
end