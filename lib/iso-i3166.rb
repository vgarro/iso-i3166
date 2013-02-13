# encoding: UTF-8

require 'json'

require 'i3166/version'
require 'i3166/data'
require 'i3166/exceptions'
require 'i3166/finders'
require 'i3166/instance'
require 'i3166/mongoid'

module Iso
  module I3166
    include Iso::I3166::Exceptions
    include Iso::I3166::Data

    class Country
      include Iso::I3166::InstanceMethods

      @countries = {}

      def self.demongoize(country)
        find(country)
      end

      def self.evolve(country)
        country.id
      end

      Iso::I3166::Data::DICTIONARY[:countries].each do |c|
        localizations = {}
        if Iso::I3166::Data::DICTIONARY[:localizations][c['alpha-2']]
          localizations = Iso::I3166::Data::DICTIONARY[:localizations][c['alpha-2']].inject({}){|memo, (k,v)| memo[k.to_sym] = v; memo}
        end

        country = Country.new(c['alpha-2'], c['alpha-3'], c['numeric'], localizations)
        @countries[country.id] = country
      end

      extend Iso::I3166::Finders
      include Iso::I3166::Mongoid
    end

    class State
      include Iso::I3616::InstanceMethods
      @states = {}

      def self.demongoize(country)
        find(country)
      end

      def self.evolve(country)
        country.id
      end

      Iso::I3166::Data::DICTIONARY[:states].each do |c|
        localizations = {}
        if Iso::I3166::Data::DICTIONARY[:localizations][c['alpha-2']]
          localizations = Iso::I3166::Data::DICTIONARY[:localizations][c['alpha-2']].inject({}){|memo, (k,v)| memo[k.to_sym] = v; memo}
        end

        state = State.new(c['alpha-2'],c['numeric'], localizations)
        @states[state.id] = state
      end

      extend Iso::I3166::Finders
      include Iso::I3166::Mongoid
    end
  end
end
