# Alidayu

A gem for use alidayun sms service

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alidayu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alidayu

## Usage

Try something like below:    

```ruby
bigfish = Alibaba::Bigfish.new('your_key','your_secret')

#sample params
params = {rec_num: '110', sms_free_sign_name:'活动验证',sms_template_code: 'SMS_4775414', sms_param: {code:'123456', product:'药药灵',item:'吃药'}}

bigfish.send_sms params
```

NOTICE:    
rec_num, sms_free_sign_name,sms_template_code,sms_param are required.    
And, if you have any question. Send me a pr, or read the f**king document.    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lostpupil/alidayu. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
