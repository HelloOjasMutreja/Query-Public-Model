class Option < ApplicationRecord
  has_many :query_options, dependent: :destroy
  has_many :queries, through: :query_options
  validates :content, presence: true
  validates :preferred, inclusion: { in: [true, false] }
end
