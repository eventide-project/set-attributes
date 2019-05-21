class SetAttributes
  module DataSource
    def self.build_data_source(source, include=nil, exclude: nil)
      if source.is_a?(::Hash)
        return DataSource::Hash.build(source, include, exclude: exclude)
      end
    end
  end
end
