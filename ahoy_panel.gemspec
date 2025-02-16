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

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_development_dependency "rspec-rails", "~> 7.0.0"
end
