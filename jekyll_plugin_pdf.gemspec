# frozen_string_literal: true

require_relative "lib/jekyll_plugin_pdf/version"

# rubocop:disable Metrics/BlockLength
Gem::Specification.new do |spec|
  github = "https://github.com/mslinn/jekyll_plugin_pdf"

  spec.authors = ["Mike Slinn"]
  spec.bindir = "exe"
  spec.description = <<~END_OF_DESC
    Creates a PDF from a Jekyll website.
  END_OF_DESC
  spec.email = ["mslinn@mslinn.com"]

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir[".rubocop.yml", "LICENSE.*", "Rakefile", "{lib,spec}/**/*", "*.gemspec", "*.md"]

  spec.homepage = "https://www.mslinn.com/blog/2020/12/30/jekyll-plugin-template-collection.html"
  spec.license = "CC0-1.0"
  spec.metadata = {
    "allowed_push_host" => "https://rubygems.org",
    "bug_tracker_uri" => "#{github}/issues",
    "changelog_uri" => "#{github}/CHANGELOG.md",
    "homepage_uri" => spec.homepage,
    "source_code_uri" => github
  }
  spec.name = "jekyll_plugin_pdf"
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.6.0"
  spec.summary = "Creates a PDF from a Jekyll website."
  spec.version = JekyllPluginPdfVersion::VERSION

  spec.add_dependency "jekyll", ">= 3.5.0"
  spec.add_dependency "jekyll_plugin_logger"
  spec.add_dependency "key-value-parser"
  spec.add_dependency "nokogiri"
  spec.add_dependency "shellwords"
  spec.add_dependency 'wicked_pdf', '~> 2.1'

  spec.add_development_dependency "debase"
  spec.add_development_dependency "ruby-debug-ide"
  spec.add_development_dependency 'wkhtmltopdf-binary'
end
# rubocop:enable Metrics/BlockLength
