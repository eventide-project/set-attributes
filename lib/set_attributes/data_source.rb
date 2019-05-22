class SetAttributes
  module DataSource
    def self.included(cls)
      cls.class_exec do
        extend Build

        def self.assure_include(source, include)
          include
        end
      end
    end

    attr_reader :source
    attr_reader :attribute_map

    def initialize(source)
      @source = source
    end

    module Build
      def build(source, include=nil, exclude: nil)
        include = assure_include(source, include)

        include ||= []
        include = Array(include)

        exclude ||= []
        exclude = Array(exclude)

        attribute_map = SetAttributes::Map.build(include)
        attribute_map.exclude(exclude)

        instance = new(source)

        return instance, attribute_map
      end
    end

    def self.build_data_source(source, include=nil, exclude: nil)
      data_source_class = implementation(source)
      data_source_class.build(source, include, exclude: exclude)
    end

    def self.implementation(source)
      if source.is_a?(::Hash)
        return DataSource::Hash
      else
        return DataSource::Object
      end
    end
  end
end
