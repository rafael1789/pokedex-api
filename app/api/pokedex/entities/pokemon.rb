module Pokedex
    module Entities
        class Pokemon < Grape::Entity
    	  format_with(:iso_timestamp) { |dt| dt.to_i }
          format_with(:to_string) { |dt| dt.to_s }

          expose :name, documentation: { type: "string", desc: "Pokemon's name. " }
          expose :avatar, documentation: { type: "string", desc: "Pokemon's avatar. " }
          expose :height , documentation: {type: "Float" , documentation: "Pokemon's height. " }
          expose :weight , documentation: {type: "Float" , documentation: "Pokemon's weight. " }
            
        end
    end
end