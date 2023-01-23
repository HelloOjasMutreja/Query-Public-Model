class Option < ApplicationRecord
  belongs_to :query
  has_many :query_options
  has_many :queries, through: :query_options
  validates :content, presence: true
  validates :preferred, inclusion: { in: [true, false] }
end
