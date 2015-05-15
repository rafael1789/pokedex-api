class Evolution < ActiveRecord::Base
  belongs_to :unevolved, class_name: "Pokemon"
  belongs_to :evolved, class_name: "Pokemon"

  validates :unevolved_id, uniqueness: { scope: :evolved_id, message: "can not evolve on its own." }, 
            if:  -> { unevolved_id == evolved_id }

  validates :unevolved_id, uniqueness: { scope: :evolved_id, message: "this association exists." }

end