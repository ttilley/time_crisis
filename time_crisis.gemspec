# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{time_crisis}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Travis Tilley"]
  s.date = %q{2009-09-30}
  s.description = %q{date and time related extensions}
  s.email = %q{ttilley@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION.yml",
     "lib/time_crisis.rb",
     "lib/time_crisis/date_range.rb",
     "lib/time_crisis/meteorological_seasons.rb",
     "lib/time_crisis/named_months.rb",
     "lib/time_crisis/support.rb",
     "lib/time_crisis/support/acts_like.rb",
     "lib/time_crisis/support/advance.rb",
     "lib/time_crisis/support/change.rb",
     "lib/time_crisis/support/conversions.rb",
     "lib/time_crisis/support/current.rb",
     "lib/time_crisis/support/readable_inspect.rb",
     "test/test_helper.rb",
     "test/time_crisis_test.rb",
     "time_crisis.gemspec"
  ]
  s.homepage = %q{http://github.com/ttilley/time_crisis}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{date and time related extensions}
  s.test_files = [
    "test/test_helper.rb",
     "test/time_crisis_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<third_base>, [">= 0"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<third_base>, [">= 0"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<third_base>, [">= 0"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end
