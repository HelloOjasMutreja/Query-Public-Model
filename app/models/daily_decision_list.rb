class DailyDecisionList < ApplicationRecord
  belongs_to :user
  has_many :daily_decisions
end
