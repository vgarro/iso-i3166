module Iso
  module I3166
    module Data
      CORE_FILE_C = File.expand_path(File.join(File.dirname(__FILE__), 'data', 'ISO_3166-1.counties.core.json'))
      I18N_FILE_C = File.expand_path(File.join(File.dirname(__FILE__), 'data', 'ISO_3166-1.countries.i18n.json'))

      CORE_FILE_S = File.expand_path(File.join(File.dirname(__FILE__), 'data', 'ISO_3166-2.states.core.json'))
      I18N_FILE_S = File.expand_path(File.join(File.dirname(__FILE__), 'data', 'ISO_3166-2.states.i18n.json'))

      CORE_C = JSON.parse(File.open(CORE_FILE_C, 'rb') { |file| file.read })
      I18N_C = JSON.parse(File.open(I18N_FILE_C, 'rb') { |file| file.read })
      COUNTRY_DICTIONARY = { countries: CORE_C, localizations: I18N_C }

      CORE_S = JSON.parse(File.open(CORE_FILE_S, 'rb') { |file| file.read })
      I18N_S = JSON.parse(File.open(I18N_FILE_S, 'rb') { |file| file.read })
      STATE_DICTIONARY = {states: CORE_S, localizations: I18N_S}
    end
  end
end
