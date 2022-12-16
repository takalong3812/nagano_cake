class Genre < ApplicationRecord
    has_many :ites,dependent: :destroy
    
    validates :name, presence: true
end
