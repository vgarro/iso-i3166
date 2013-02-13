module Iso
  module I3166
    module Mongoid
      def mongoize
        id
      end

      # def self.demongoize(country)
      #   "find(country)"
      # end

      # def self.evolve(country)
      #   country.id
      # end
    end
  end
end
