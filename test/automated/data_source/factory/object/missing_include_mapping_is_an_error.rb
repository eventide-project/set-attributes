require_relative '../../../../test_init'

context "Data Source" do
  context "Factory" do
    context "Object" do
      context "Missing Include Mapping" do
        source = Controls::Object.example

        test "Is an error" do
          assert proc { SetAttributes::DataSource.build_data_source(source) } do
            raises_error? SetAttributes::DataSource::Object::Error
          end
        end
      end
    end
  end
end
