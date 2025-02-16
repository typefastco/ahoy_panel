# frozen_string_literal: true

require_relative "lib/ahoy_panel/version"

Gem::Specification.new do |spec|
  spec.name = "ahoy_panel"
  spec.version = AhoyPanel::VERSION
  spec.authors = ["Chris Jeon"]
  spec.email = ["chris@typefast.co"]

  spec.summary = "Interactive dashboard panel for Ahoy analytics for Rails apps."
  spec.description = "Ahoy is a great analytics tracking gem. AhoyPanel is a great dashboard for the data collected by Ahoy."
  spec.homepage = "https://www.ahoypanel.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/typefastco/ahoy_panel."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "rspec", "~> 3.2"
end
