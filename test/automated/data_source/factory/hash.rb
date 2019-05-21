require_relative '../../../test_init'

context "Data Source" do
  context "Factory" do
    context "Hash" do
      source = Controls::Hash.example
      
      data_source = SetAttributes::DataSource.build_data_source(source)

      test "Is a hash data source" do
        assert(data_source.is_a?(SetAttributes::DataSource::Hash))
      end
    end
  end
end
