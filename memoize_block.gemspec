require_relative 'lib/memoize_block/version'

Gem::Specification.new do |spec|
  spec.name          = "memoize_block"
  spec.version       = MemoizeBlock::VERSION
  spec.authors       = ["Adam Steel", "Tom Bonan"]
  spec.email         = ["adamgsteel@gmail.com", "tombonan018@gmail.com"]
  spec.summary       = %q{Inline memoize helper method}
  spec.description   = %q{
    Easily memoize any operation with this global method that takes a block.
  }
  spec.homepage      = "https://github.com/truecoach/memoize_block"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-doc'
  spec.add_development_dependency 'rubocop'
end
