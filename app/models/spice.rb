class Spice < ApplicationRecord

    validates :title, presence: true, uniqueness: true

end
