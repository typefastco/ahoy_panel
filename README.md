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

## Running the gem locally

1. Install the gem in your locally run app
2. In routes.rb, mount the engine

```ruby
mount AhoyPanel::Engine, at: "/ahoy_panel"
```

3. Run the tailwindcss watch command in the root of the gem

```bash
$ bundle exec rails app:tailwindcss:watch
```

4. Run the rails server in your Rails application

```bash
$ bundle exec rails s
```

5. Navigate to `/ahoy_panel` to see the dashboard

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
