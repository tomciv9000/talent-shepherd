class CastingOffice < ApplicationRecord
    belongs_to :agency
    has_many :casting_people
    has_many :projects
    has_many :appointments
    has_many :actors, through: :appointments
    has_many :comments, as: :commentable

end
