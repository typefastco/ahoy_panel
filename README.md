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

Add this line to your Rails application's Gemfile:

```ruby
gem "ahoy_panel"
```

And then execute:

```bash
bundle install
```

Mount AhoyPanel in your `config/routes.rb` file:
```ruby
Rails.application.routes.draw do
  mount AhoyPanel::Engine => "ahoy_panel"
end
```

---

## Configuration

After installing the gem, you'll need to configure it to connect to your Ahoy Panel account. This gem assumes that you already have `ahoy_matey` gem installed, configured, and in usage.

Create an initializer file:

```ruby
# config/initializers/ahoy_panel.rb
AhoyPanel.configure do |config|
  # Your project’s API key from https://www.ahoypanel.com/settings
  config.api_key = ENV.fetch("AHOY_PANEL_API_KEY")
end
```

Add your API key to your environment variables:

```bash
# .env
AHOY_PANEL_API_KEY=your-api-key-here
```

---

## Usage

Once configured, anytime you load your dashboard in [Ahoy Panel](https://www.ahoypanel.com), your `ahoy_panel` will send the data that's needed `Ahoy::Visit` and `Ahoy::Event` to [Ahoy Panel](https://www.ahoypanel.com) to build the dashboard.

No extra setup required – just install, configure, and you're done! 🎉

---

## Requirements

- Rails 6+
- [Ahoy](https://github.com/ankane/ahoy) gem installed and configured

---

## Privacy & Performance

- Events are batched and sent asynchronously to minimize request overhead  
- Only relevant event data (like `name`, `properties`, `user_id`, and timestamps) is sent  
- You retain full control over what data is tracked  

---

## Troubleshooting

- Ensure your API key is correct and the base_url configured in your [Ahoy Panel](https://www.ahoypanel.com) account is correct. Any issues, reach out.

---

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/typefastco/ahoy_panel](https://github.com/typefastco/ahoy_panel).

---

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
