# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rsrt}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Oliver Nightingale"]
  s.date = %q{2009-09-29}
  s.default_executable = %q{shift_subtitle}
  s.description = %q{This gem includes the command line application shift_subtitle, a quick application that allows people to shift the times of subtitles in a .srt file.

This application was created as part of the RubyLearning Blog competition here http://rubylearning.com/blog/2009/09/24/rpcfn-shift-subtitle-1/}
  s.email = ["oliver.nightingale2@ntlworld.com"]
  s.executables = ["shift_subtitle"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = ["bin/shift_subtitle", "History.txt", "lib/rsrt.rb", "lib/rsrt/srt_parser.rb", "lib/rsrt/subtitle.rb", "lib/rsrt/time_range.rb", "lib/shift_subtitle/cli.rb", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "rsrt.gemspec", "script/console", "script/destroy", "script/generate", "test/test_helper.rb", "test/test_subtitle.rb", "test/test_time_range.rb"]
  s.homepage = %q{http://github.com/olivernn/rsrt}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rsrt}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{This gem includes the command line application shift_subtitle, a quick application that allows people to shift the times of subtitles in a .srt file}
  s.test_files = ["test/test_helper.rb", "test/test_subtitle.rb", "test/test_time_range.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
