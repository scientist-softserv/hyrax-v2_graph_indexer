require_relative "lib/hyrax/v2_graph_indexer/version"

Gem::Specification.new do |spec|
  spec.name        = "hyrax-v2_graph_indexer"
  spec.version     = Hyrax::V2GraphIndexer::VERSION
  spec.authors     = ["Jeremy Friesen"]
  spec.email       = ["jeremy.n.friesen@gmail.com"]
  spec.homepage    = "https://github.com/scientist-softserv/hyrax-v2_graph_indexer"
  spec.summary     = "A quasi-backport of the Hyrax 3+ Graph Indexing."
  spec.description = "A quasi-backport of the Hyrax 3+ Graph Indexing."
  spec.required_ruby_version = ">= 2.6.0"

  spec.licenses = ["Apache-2.0"]
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = File.join(spec.homepage, "CHANGELOG.md")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hyrax", "~> 2.9"

  # Instead of requiring all of Rails, let's just require the narrowest aspect of Rails to get this
  # configuration/integration working.  Besides, Hyrax will bring Rails into this as well.
  spec.add_dependency "railties"
end
