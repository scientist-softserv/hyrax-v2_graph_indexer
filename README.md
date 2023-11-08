# Hyrax::V2GraphIndexer

The `Hyrax::V2GraphIndexer` gem encapsulates a quasi-backport of the graph indexing now in [Hyrax](https://github.com/samvera/hyrax)'s `main` branch as well as the Hyrax `3.x` release.

What do we mean by a quasi-backport?  Namely it doesn't attempt to make the graphing configurable; instead when you include this gem you then replace the venerable and non-performant [Samvera::NestingIndexer](https://github.com/samvera-labs/samvera-nesting_indexer).  You instead favor a the graph feature of SOLR.

## Usage

Add this gem to your `2.9.x` Hyrax application's Gemfile.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "hyrax-v2_graph_indexer"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install hyrax-v2_graph_indexer
```

### Prior to v0.5.0

For this to work, you'll need to add the following to your application's `./config/initializers/hyrax.rb`:

```ruby
Hyrax.config do |config|
  config.nested_relationship_reindexer = ->(id:, extent:) {}
end
```

With the upcoming v0.5.0, the above will be automatically added via the [Hyrax::V2GraphIndexer::Railtie](./lib/hyrax/v2_graph_indexer/railtie.rb).

## Contributing

## Discussion

This gem does not have much in the way of tests; it has instead been tested against production implementations.  The lack of tests is a concession to the return on investment of writing tests for a previous major version of Hyrax which no longer sees updates.

This code was added to [Adventist's Hyku code-base](https://github.com/scientist-softserv/adventist-dl/) in the [fddb2863 commit](https://github.com/scientist-softserv/adventist-dl/commit/fddb28638a1f5a823399722ffb74916d0f584225).

From that commit message:

> Prior to this commit, we had disabled the logic for indexing the parent
> child relationships of objects.  This results in broken behavior
> regarding nesting collections and works.  Were we to enable the
> "classic" strategy for indexing, we created significant (and known)
> performance issues.
>
> With this commit, we are taking code that was backported to the 3.x
> branch of Hyrax via [samvera/hyrax#5858][5858] and
> [samvera/hyrax#5916][5916] and projecting that onto the 2.9.x
> implementation.
>
> This projection means that we are not directly backporting but instead
> structuring the code such that if you include it, it assumes you using
> SOLR's native graph indexing.  The aforementioned PRs put those changes
> behind a configuration variable; which is not something that makes sense
> given this "hack."
>
> This PR aims to resolve three issues, which by their nature, are
> inter-related.  The issues are:
>
> - [x] Adding works to a collection [#59][59]
> - [x] Backporting graph indexing [#68][68]
> - [x] Adding a collection to another collection [#70][70]
>
> [59]: #59
> [68]: #68
> [70]: #70
> [5858]: samvera/hyrax#5858
> [5916]: samvera/hyrax#5916

## License

The gem is available as open source under the terms of the [Apache 2](https://opensource.org/licenses/Apache-2.0).
