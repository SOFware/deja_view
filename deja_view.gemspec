# frozen_string_literal: true

require_relative "lib/deja_view/version"

Gem::Specification.new do |spec|
  spec.name = "deja_view"
  spec.version = DejaView::VERSION
  spec.authors = ["Barry Welch"]
  spec.email = ["barry.welch@sofwarellc.com"]

  spec.summary = "Warns users when they've gone back to the new " \
    "context with the back button"
  spec.description = "Prevent users from creating multiple new records " \
    "accidentally by informing them they've gone back into a new model " \
    "creation context"
  spec.homepage = "https://github.com/SOFware/deja_view"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata = {
    "allowed_push_host" => "https://rubygems.pkg.github.com/sofware",
    "github_repo" => "ssh://github.com/SOFware/deja_view.git",
    "changelog_uri" => "https://github.com/SOFware/deja_view/blob/master/CHANGELOG.md"
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,lib}/**/*", "Rakefile", "README.md"]
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rails", ">= 6.1"
end
