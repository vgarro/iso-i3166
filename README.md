#ISO-I3166

The iso-i3166 gem helps you manage country and state data without needing rely on a database.

It uses values from the ISO 3166-1 standard for country codes and ISO 3166-2 for locality.
The data can be localized, making it easy to present country and state names correctly for a given local or country (eg Spain vs España)
Additionally gives helpfull finders to normalize user input data into iso standards. 

## Usage

Once the gem is loaded it provides pure Ruby instances of the countries and states listed in the source data .json files. Countries are primarily referenced using a symbol of their ISO 3166-1 Alpha-2 two-character country code:

    sample_codes = [:us, :gb, :ru]

The easiest way to access a country's object instance is with the ::find method:

    Iso::I3166::Country.find(:us)
    # => #<Iso::I3166::Country:0x007f93439c8c30>

You can return an array of multiple countries:

    Country.find(:us, :gb, :ru)

To return an array of all countries (there is no guarantee as to the order):

    Country.all # or Country.find(:all)

Basic full-name searching can be done with

    Country.find_with_name("Brazil")

This will search all localizations, but the input must be an exact match. If you want to search a specific localization only:

    Country.find_with_name("España", :es)

There is also a ::where method that will do it's best to find what you're looking for

    Country.where(:us)
    Country.where('RU')
    Country.where('GBR')
    Country.where(100)
    Country.where('Sweeden')
    Country.where(alpha2: :ru)
    Country.where(alpha3: :gbr)
    Country.where(numeric: 100)

## Mongoid

Support for country as a Mongoid field type is included

    field :country, type: Iso::I3166::Country

You could then

    country = Country.find(params[:country])
    Place.new(name: params[:name], country: country)

And later

    place.country.name

Without needing to create a new table in your database with seeded country data

## Rails

A future version of the gem will include a form helper

## TODO

- Support for actual localization (en-us, etc) rather than just language (en, etc)
- When there's a default locale (eg in a rails app) use that
- Support for long and short names in localizations
- Better searching for partial name matches


## License

MIT license
