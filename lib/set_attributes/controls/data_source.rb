class SetAttributes
  module Controls
    module DataSource
      def self.example
        mapping = Controls::AttributeMap.example

        source = SetAttributes::Controls::Hash.example

        data_source = Example.build(source, mapping)

        data_source
      end

      class Example
        include SetAttributes::DataSource

        def self.assure_include(source, include)
          include
        end
      end
    end
  end
end
