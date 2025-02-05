lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "myfinance/version"

Gem::Specification.new do |spec|
  spec.name                 = "myfinance"
  spec.version              = Myfinance::VERSION
  spec.authors              = [
    "Eduardo Hertz",
    "Guilherme Franco",
    "Rafael B. Tauil",
    "Rodrigo Tassinari",
    "Vagner Zampieri"
  ]
  spec.email                = [
    "eduardohertz@gmail.com",
    "g.francosilva@gmail.com",
    "rafael@tauil.com.br",
    "rodrigo@pittlandia.net",
    "vgzampieri@gmail.com"
  ]
  spec.required_ruby_version = ">= 2.0.0"

  spec.summary       = %q{A Ruby client for the Myfinance REST API}
  spec.description   = %q{A Ruby client for the Myfinance REST API: https://financeiro.fintera.com.br/docs/api}
  spec.homepage      = "https://github.com/Myfc-github/myfinance-client-ruby/pulls"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting "allowed_push_host", or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files`.split($/).reject { |f| f =~ %r{(vcr_cassettes)/} }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "typhoeus", "~> 0.8"
  spec.add_dependency "multi_json", "~> 1.11"
  spec.add_dependency "virtus", "~> 1.0.5"
  spec.add_dependency "mime-types", ">= 1.16", "<= 3.4.0"
  spec.add_dependency "require_all", "~> 1.4.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr", "~> 2.4"
  spec.add_development_dependency "webmock", "~> 1.9.3"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "pry-nav", "~> 0.2"
  spec.add_development_dependency "awesome_print", "~> 1.1"
  spec.add_development_dependency "simplecov", "~> 0.9"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
end
