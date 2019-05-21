require_relative '../../../test_init'

context "Data Source" do
  context "Object" do
    context "Include is Omitted" do
      source = Controls::Object.example

      test "Is an error" do
        assert proc { SetAttributes::DataSource.build_data_source(source) } do
          raises_error? SetAttributes::DataSource::Object::Error
        end
      end
    end
  end
end
