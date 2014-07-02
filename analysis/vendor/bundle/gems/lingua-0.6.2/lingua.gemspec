# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lingua}
  s.version = "0.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Balatero"]
  s.date = %q{2010-07-25}
  s.description = %q{Provides sentence splitting, syllable, and text-quality algorithms.}
  s.email = %q{dbalatero@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "CHANGELOG.markdown",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/lingua.rb",
     "lib/lingua/en/paragraph.rb",
     "lib/lingua/en/readability.rb",
     "lib/lingua/en/sentence.rb",
     "lib/lingua/en/syllable.rb",
     "lib/lingua/en/syllable/guess.rb",
     "lingua.gemspec",
     "spec/lingua/en/paragraph_spec.rb",
     "spec/lingua/en/readability_spec.rb",
     "spec/lingua/en/sentence_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/dbalatero/lingua}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{This is a maintained version of Ruby's Lingua port.}
  s.test_files = [
    "spec/lingua/en/paragraph_spec.rb",
     "spec/lingua/en/readability_spec.rb",
     "spec/lingua/en/sentence_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end
