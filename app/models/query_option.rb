class QueryOption < ApplicationRecord
  belongs_to :query
  belongs_to :option
  # nested attribute
  accepts_nested_attributes_for :option
end
