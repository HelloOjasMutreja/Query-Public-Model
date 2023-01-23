class Query < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  belongs_to :user
  has_many :query_options
  has_many :options, through: :query_options
  accepts_nested_attributes_for :query_options
end
