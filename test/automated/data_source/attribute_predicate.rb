require_relative '../automated_init'

context "Data Source" do
  context "Attribute Predicate" do
    hash_source = Controls::Hash.example
    object_source = Controls::Object.example

    [[hash_source, 'Hash'], [object_source, 'Object']].each do |source_info|

      source = source_info[0]
      source_type = source_info[1]

      context "#{source_type} Source" do
        data_source = SetAttributes::DataSource.build_data_source(source)

        value = data_source.get_value(:some_attribute)

        context "Attribute Present in the Source" do
          test "Detected" do
            assert(data_source.attribute?(:some_attribute))
          end
        end

        context "Attribute Not Present in the Source" do
          test "Not Detected" do
            refute(data_source.attribute?(Controls::Attribute::Random.example))
          end
        end
      end
    end
  end
end
