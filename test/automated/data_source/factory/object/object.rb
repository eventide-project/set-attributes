require_relative '../../../../test_init'

context "Data Source" do
  context "Factory" do
    context "Object" do
      source = Controls::Object.example

      placeholder_mapping = []

      data_source = SetAttributes::DataSource.build_data_source(source, placeholder_mapping)

      test "Is an object data source" do
        assert(data_source.is_a?(SetAttributes::DataSource::Object))
      end
    end
  end
end
