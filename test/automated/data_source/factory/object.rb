require_relative '../../../test_init'

context "Data Source" do
  context "Factory" do
    context "Object" do
      source = Controls::Object.example

      data_source = SetAttributes::DataSource.build_data_source(source)

      test "Is an object data source" do
        assert(data_source.is_a?(SetAttributes::DataSource::Object))
      end
    end
  end
end
