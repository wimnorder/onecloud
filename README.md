# Onecloud

Onecloud - API wrapper for Russian cloud provider 1Cloud.ru  
[![Gem Version](https://badge.fury.io/rb/onecloud.svg)](https://badge.fury.io/rb/onecloud)
![](http://ruby-gem-downloads-badge.herokuapp.com/onecloud?type=total)  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'onecloud'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install onecloud

## Usage

```ruby
require 'onecloud'

api = Onecloud::Api.new('API_SECRET_TOKEN')  

# Get account balance
api.balance

# Create new server
api.add_server({
    Name: "testAPI",
    CPU: 1,
    RAM: 1024,
    HDD: 40,
    imageID: 1,
    HDDType: "SSD",
    IsHighPerformance: true
})

# List all created servers
api.servers

# Update the server parameters
api.update_server_by_id('SERVER_ID', {
    isHigtPerformance: false, 
    CPU: 2, 
    RAM: 2048, 
    HDD: 80
})
```
See examples [here](https://github.com/wimnorder/onecloud-examples)

## Development

Pull requests are welcome!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wimnorder/onecloud.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

