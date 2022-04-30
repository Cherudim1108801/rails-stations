class Movie < ApplicationRecord
    validates :id, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
end
