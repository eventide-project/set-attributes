class SetAttributes
  module DataSource
    def self.build_data_source(source, include=nil, exclude: nil)
      ## Class selector, rather than direct construction
      if source.is_a?(::Hash)
        return DataSource::Hash.build(source, include, exclude: exclude)
      elsif source.is_a?(::Object)
        return DataSource::Object.build(source, include, exclude: exclude)
      end
    end
  end
end
