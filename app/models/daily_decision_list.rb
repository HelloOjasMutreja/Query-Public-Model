class DailyDecisionList < ApplicationRecord
  belongs_to :user
  has_many :queries
end
