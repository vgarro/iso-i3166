# encoding: UTF-8

require 'json'

require 'iso-i3166/version'
require 'iso-i3166/data'
require 'iso-i3166/exceptions'
require 'iso-i3166/finders'
require 'iso-i3166/instance'
require 'iso-i3166/mongoid'

module Iso
  module I3166
    include Iso::I3166::Exceptions
    include Iso::I3166::Data

    class Country
      include Iso::I3166::InstanceMethods

      @entries = {}

      def self.demongoize(entry)
        find(entry)
      end

      def self.evolve(entry)
        entry.id
      end

      Iso::I3166::Data::COUNTRY_DICTIONARY[:countries].each do |c|
        localizations = {}
        if Iso::I3166::Data::COUNTRY_DICTIONARY[:localizations][c['alpha-2']]
          localizations = Iso::I3166::Data::COUNTRY_DICTIONARY[:localizations][c['alpha-2']].inject({}){|memo, (k,v)| memo[k.to_sym] = v; memo}
        end

        entry = Country.new(c['alpha-2'], c['alpha-3'], c['numeric'], localizations)
        @entries[entry.id] = entry
      end

      extend Iso::I3166::Finders
      include Iso::I3166::Mongoid
    end

    class State
      include Iso::I3166::InstanceMethods
      @entries = {}

      def self.demongoize(entry)
        find(entry)
      end

      def self.evolve(entry)
        entry.id
      end

      states = Iso::I3166::Data::STATE_DICTIONARY[:states]
      localizations = Iso::I3166::Data::STATE_DICTIONARY[:localizations]
      states.each do | s |
          s[1].each_index do |index|
            entry = State.new(s[0], nil, s[1][index], localizations[s[0]][index].inject({}){|memo, (k,v)| memo[k.to_sym] = v; memo})
            @entries[entry.id] = entry
        end
      end

      extend Iso::I3166::Finders
      include Iso::I3166::Mongoid
    end
  end
end
