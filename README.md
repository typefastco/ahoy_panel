# Ahoy Panel

[![Gem Version](https://badge.fury.io/rb/ahoy_panel.svg)](https://badge.fury.io/rb/ahoy_panel)

**Ahoy Panel** is a companion gem for the [Ahoy Panel](https://www.ahoypanel.com) web app – a modern, hosted dashboard for your [Ahoy](https://github.com/ankane/ahoy) analytics data.

It enables your Rails app to stream Ahoy events to the Ahoy Panel API for real-time analytics and beautiful insights.

---

## Features

- 🔌 Simple integration with your existing Ahoy setup  
- 📊 Centralized dashboard at [ahoypanel.com](https://www.ahoypanel.com)  
- 🚀 Lightweight and configurable  
- 🔐 Secure API key-based authentication  

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ahoy_panel'
```

And then execute:

```bash
bundle install
```

---

## Configuration

After installing the gem, you'll need to configure it to connect to your Ahoy Panel account.

Create an initializer file:

```ruby
# config/initializers/ahoy_panel.rb
AhoyPanel.configure do |config|
  # Your project’s API key from https://www.ahoypanel.com/settings
  config.api_key = ENV.fetch("AHOY_PANEL_API_KEY")

  # (Optional) Set the API endpoint if you're self-hosting
  # config.api_url = "https://your-self-hosted-instance.com/api/v1/events"

  # (Optional) Set the environment(s) where data should be sent
  config.enabled_environments = %w[production]
end
```

Add your API key to your environment variables:

```bash
# .env
AHOY_PANEL_API_KEY=your-api-key-here
```

---

## Usage

Once configured, `ahoy_panel` will automatically listen to Ahoy events (`Ahoy::Event`) and send them to the Ahoy Panel service in the background.

No extra setup required – just install, configure, and you're done! 🎉

---

## Requirements

- Ruby 3.0+
- Rails 6.1+
- [Ahoy](https://github.com/ankane/ahoy) gem installed and configured

---

## Privacy & Performance

- Events are batched and sent asynchronously to minimize request overhead  
- Only relevant event data (like `name`, `properties`, `user_id`, and timestamps) is sent  
- You retain full control over what data is tracked  

---

## Troubleshooting

- Ensure your API key is correct and has access to the project  
- Confirm the gem is only enabled in the correct environment  
- Check logs for any delivery errors or rate limit issues  

---

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/yourusername/ahoy_panel](https://github.com/yourusername/ahoy_panel).

---

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
