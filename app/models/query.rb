class Query < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 50 }
    belongs_to :user
end
