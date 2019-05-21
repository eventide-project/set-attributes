class SetAttributes
  module Controls
    module DataSource
      def self.example(exclude: nil)
        mapping = Controls::Mapping.example

        source = SetAttributes::Controls::Hash.example

        data_source = Example.build(source, mapping, exclude: exclude)

        data_source
      end

      class Example
        include SetAttributes::DataSource
      end
    end
  end
end
