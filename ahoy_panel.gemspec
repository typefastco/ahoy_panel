require_relative "lib/ahoy_panel/version"

Gem::Specification.new do |spec|
  spec.name        = "ahoy_panel"
  spec.version     = AhoyPanel::VERSION
  spec.authors     = [ "Chris Jeon" ]
  spec.email       = [ "chris@typefast.co" ]
  spec.homepage    = "https://www.ahoypanel.com"
  spec.summary     = "Interactive dashboard panel for Ahoy analytics for Rails apps."
  spec.description = "Ahoy is a great analytics tracking gem. AhoyPanel is a great dashboard for the data collected by Ahoy"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/typefastco/ahoy_panel."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "tailwindcss-rails", "~> 3.3.1"
  spec.add_dependency "importmap-rails", "~> 2.1.0"
  spec.add_dependency "turbo-rails", "~> 2.0.11"
  spec.add_dependency "stimulus-rails", "~> 1.3.4"
  spec.add_dependency "heroicon", "~> 1.0.0"
  spec.add_dependency "inline_svg", "~> 1.10.0"
  spec.add_dependency "chartkick", "~> 5.1.3"
  spec.add_dependency "groupdate", "~> 6.5.1"
  spec.add_dependency "countries", "~> 7.1.0"
  spec.add_dependency "view_component", "~> 3.21.0"
  spec.add_development_dependency "rspec-rails", "~> 7.1.0"
end
