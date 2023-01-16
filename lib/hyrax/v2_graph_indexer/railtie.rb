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

        ActiveFedora::Base.subclasses.each do |subclass|
          if subclass.included_modules.include?(Hyrax::WorkBehavior) ||
              subclass.included_modules.include?(Hyrax::CollectionBehavior)
            subclass.prepend(Hyrax::V2GraphIndexer::CollectionNestingDecorator)
          end
        end

        Hyrax::Dashboard::NestedCollectionsSearchBuilder.prepend(
          Hyrax::V2GraphIndexer::NestedCollectionsSearchBuilderDecorator
        )
      end
    end
  end
end
