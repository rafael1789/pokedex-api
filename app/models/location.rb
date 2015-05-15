class Location < ActiveRecord::Base  
  belongs_to :pokemon
  
  validates :pokemon_id, uniqueness: { 
  	          scope: [:latitude, :longitude], 
  	          message: "has already been reported in this place." 
  	        }

  validates :latitude, :longitude, presence: true
end

