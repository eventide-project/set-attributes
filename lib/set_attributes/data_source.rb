class SetAttributes
  module DataSource
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
