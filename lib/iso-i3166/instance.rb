module Iso
  module I3166
    module InstanceMethods
      attr_reader :id, :alpha2, :alpha3, :numeric

      def initialize(alpha2, alpha3, numeric, localized_names = {})
        @id = (alpha2.downcase + '_' + numeric.to_s).to_sym
        @alpha2 = alpha2
        @alpha3 = alpha3
        @numeric = numeric
        @localized_names = localized_names
      end

      def names
        @localized_names
      end

      def name(locale = :en)
        if @localized_names.empty?
          "#{alpha3} (#{"%03d" % numeric})"
        else
          @localized_names[locale]
        end
      end

      alias :__to_s :to_s

      def to_s
        name
      end

      def inspect
        { id: @id, name: names, alpha2: @alpha2, alpha3: @alpha3, numeric: @numeric }
      end
    end
  end
end
