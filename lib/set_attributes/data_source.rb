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

    def initialize(source, attribute_map)
      @source = source
      @attribute_map = attribute_map
    end

    def exclude(*attributes)
      attribute_map.exclude(attributes)
    end

    module Build
      def build(source, include=nil, exclude: nil)
        include = assure_include(source, include)

        include ||= []
        include = Array(include)

        exclude ||= []
        exclude = Array(exclude)

        attribute_map = SetAttributes::Map.build(include)

        instance = new(source, attribute_map)
        instance.exclude(exclude)
        instance
      end
    end

    def self.build_data_source(source, include=nil, exclude: nil)
      data_source_class = select_class(source)
      data_source_class.build(source, include, exclude: exclude)
    end

    def self.select_class(source)
      if source.is_a?(::Hash)
        return DataSource::Hash
      else
        return DataSource::Object
      end
    end
  end
end
