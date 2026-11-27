class Inventory < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'
  has_many :inventory_tags
  has_many :tags, through: :inventory_tags

  enum :visibility, { public: 'public', private: 'private' }, prefix: true, validate: true

  validates :title, presence: true, length: { maximum: TITLE_MAX_LENGTH }
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }
end
