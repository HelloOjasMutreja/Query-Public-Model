class Query < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  belongs_to :user
  before_destroy :destroy_options
  has_many :query_options
  has_many :options, through: :query_options
  accepts_nested_attributes_for :query_options, allow_destroy: true

  private
  
  def destroy_options
    options.each do |option|
      option.destroy
    end
  end
end
