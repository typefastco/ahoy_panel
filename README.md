# AhoyPanel
AhoyPanel is a rails engine that will give detailed analytics on Rails apps that use ahoy to collect analytics data.

## Usage
Install the gem in your Gemfile.

```ruby
gem "ahoy_panel"
```

And in `config/routes.rb`

```ruby
mount AhoyPanel::Engine, at: "/ahoy_panel"
```

And then navigate to `/ahoy_panel` to see the dashboard.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "ahoy_panel"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ahoy_panel
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
