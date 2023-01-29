class User < ApplicationRecord

  after_create :create_daily_decision_list
  has_many :queries
  has_one :daily_decision_list

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def create_daily_decision_list
    DailyDecisionList.create(user_id: self.id)
  end
end
