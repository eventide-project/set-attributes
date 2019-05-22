class SetAttributes
  module DataSource
    def self.included(cls)
      cls.class_exec do
        extend Build
      end
    end

    attr_reader :source

    def initialize(source)
      @source = source
    end

    module Build
      def build(source)
        new(source)
      end
    end

    def self.build_data_source(source)
      data_source_class = implementation(source)
      data_source_class.build(source)
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
