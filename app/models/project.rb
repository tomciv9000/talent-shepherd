class Project < ApplicationRecord
    include ResourceNames
    belongs_to :casting_office
    belongs_to :agency
    acts_as_tenant(:agency)
    has_many :appointments, dependent: :destroy
    has_many :bookings, dependent: :destroy
    has_many :actors, through: :bookings
   
    validates :name, :media_type, :casting_office_id, presence: true

    scope :by_start_date, -> { order(start_date: :asc) }
   
    
    
    accepts_nested_attributes_for :casting_office

    def casting_office_attributes=(casting_office_attributes)
        if !casting_office_attributes[:name].blank?
            self.casting_office = CastingOffice.find_or_create_by(name: casting_office_attributes[:name])  
            self.casting_office.agency_id = casting_office_attributes[:agency_id] 
        end
    end


end

