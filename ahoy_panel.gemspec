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

  spec.add_dependency "rails", ">= 8.0.1"
  spec.add_dependency "tailwindcss-rails"
  spec.add_dependency "importmap-rails"
  spec.add_dependency "turbo-rails"
  spec.add_dependency "stimulus-rails"
  spec.add_dependency "heroicon"
  spec.add_dependency "inline_svg"
  spec.add_dependency "chartkick"
  spec.add_dependency "groupdate"
  spec.add_dependency "countries"
  spec.add_dependency "view_component"
  spec.add_development_dependency "rspec-rails", "~> 7.1.0"
end
