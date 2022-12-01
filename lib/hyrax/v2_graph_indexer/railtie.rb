module Hyrax
  module V2GraphIndexer
    class Railtie < ::Rails::Railtie

      config.to_prepare do
        Hyrax::Collections::NestedCollectionPersistenceService.singleton_class.prepend(
          Hyrax::V2GraphIndexer::NestedCollectionPersistenceServiceDecorator::ClassMethods
        )

        Hyrax::Forms::Dashboard::NestCollectionForm.prepend(
          Hyrax::V2GraphIndexer::NestCollectionFormDecorator
        )

        Hyrax::Collections::NestedCollectionQueryService.singleton_class.prepend(
          Hyrax::V2GraphIndexer::NestedCollectionQueryServiceDecorator::ClassMethods
        )

        Hyrax::WorkBehavior.prepend(
          Hyrax::V2GraphIndexer::CollectionNestingDecorator
        )

        Hyrax::CollectionBehavior.prepend(
          Hyrax::V2GraphIndexer::CollectionNestingDecorator
        )

        Hyrax::Dashboard::NestedCollectionsSearchBuilder.prepend(
          Hyrax::V2GraphIndexer::NestedCollectionsSearchBuilderDecorator
        )
      end
    end
  end
end
