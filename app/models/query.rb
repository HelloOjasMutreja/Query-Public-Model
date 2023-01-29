class Query < ApplicationRecord
  
  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  
  belongs_to :user
  
  before_destroy :destroy_options
  has_many :query_options
  has_many :options, through: :query_options
  accepts_nested_attributes_for :query_options, allow_destroy: true
  
  before_save :set_default_category
  belongs_to :category, optional: true, default: -> { Category.find_by(name: 'uncategorized') }

  belongs_to :daily_decision_list, optional: true
  has_one :daily_decision
  before_destroy :nullify_daily_decision_list_id

  def set_default_category
    self.category_id ||= Category.default.id
  end

  def nullify_daily_decision_list_id
    DailyDecision.where(query_id: id).update_all(daily_decision_list_id: nil)
  end

  private
  
  def destroy_options
    options.each do |option|
      option.destroy
    end
  end
end
