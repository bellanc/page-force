# PageForce

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/page-force`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'page-force'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install page-force

## Usage

### Defining your page object

To start, you must create a connection to your Salesforce org,

You define a new pageforce page object by including the RestForce module:

````ruby
class AccountPage
  include PageForce
end
````

When you include this module,the PageObject module and additional Saleforce specific methods are added to your class that allow you to easily define your Salesforce page. For the Account object page you might add the following:

````ruby
class AccountPage
  include PageForce

  self.object_label = 'Account'

  sfdc_picklist(:type, sfdc_field_name: 'Type')
  sfdc_lookup(:parent_account, sfdc_field_name: 'Parent_Account')
  sfdc_checkbox(:approved?, sfdc_field_name: 'Approved')
  button(:edit, sfdc_field_name: 'edit')

end
````

## Supported Salesforce Fields

- Type
- Auto Number
- Checkbox
- Currency
- Date
- Date/Time
- Email
- External Lookup Relationship
- Geolocation
- Hierarchical Relationship
- Indirect Lookup Relationship
- Lookup Relationship
- Master-Detail Relationship
- Number
- Note
- Percent
- Phone
- Picklist
- Picklist (Multi-select)
- Roll-Up Summary
- Text
- Text (Encrypted)
- Text Area
- Text Area (Long)
- Text Area (Rich)
- URL


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Bug reports are welcome on at https://github.com/[USERNAME]/page-force.

