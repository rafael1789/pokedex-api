class Pokemon < ActiveRecord::Base 
  has_many :relationships, class_name: "Evolution",
                           foreign_key: "unevolved_id",
                           dependent: :destroy
  has_many :evolutions, through: :relationships, source: :evolved
  
  has_many :reverse_relationships, class_name: "Evolution", 
                                   foreign_key: "evolved_id",
                                   dependent: :destroy
  has_many :pre_evolutions, through: :reverse_relationships, source: :unevolved 

  has_many :types, dependent: :destroy 
  has_many :species, dependent: :destroy
  has_many :weaknesses, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :locations, dependent: :destroy

  before_create :generate_uuid

  validates :name, uniqueness: true, presence: true

  private

    def generate_uuid
      begin 
        self.uuid = SecureRandom.uuid
      end while !Pokemon.where(uuid: self.uuid).empty?
    end
end

