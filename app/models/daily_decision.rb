class DailyDecision < ApplicationRecord
  belongs_to :user
  belongs_to :query
  belongs_to :daily_decision_list
  has_many :options, through: :query
end
