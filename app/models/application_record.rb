class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  TITLE_MAX_LENGTH = 100
  DESCRIPTION_MAX_LENGTH = 5_000
end
