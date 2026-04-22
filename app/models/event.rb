class Event < ApplicationRecord
    validates :title, :start_date, presence: true
    validates :external_id, uniqueness: true
end
