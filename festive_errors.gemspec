require_relative "lib/festive_errors/version"

Gem::Specification.new do |spec|
  spec.name = "festive_errors"
  spec.version = FestiveErrors::VERSION
  spec.authors = ["Joshua Wood"]
  spec.email = ["josh@joshuawood.net"]
  spec.homepage = "https://github.com/honeybadger-io/festive_errors"
  spec.summary = "Add some year-round holiday cheer to the Rails error page."
  spec.description = "Festive Errors is a Rails gem that spices up the Rails error page with fun holiday themes. We all like to do a little coding around the holidays. Get into the holiday spirit with Festive Errors!"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/honeybadger-io/festive_errors"
  spec.metadata["changelog_uri"] = "https://github.com/honeybadger-io/festive_errors/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  end

  spec.add_dependency "rails", ">= 7.0.0"
end
