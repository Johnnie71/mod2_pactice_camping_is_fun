class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 7, less_than: 19}


    def camper_activities
        self.signups.all.select { |act| act.camper_id == self.id }
    end
end

# Signup.first.activity.name