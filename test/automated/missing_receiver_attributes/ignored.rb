require_relative '../../test_init'

context "Missing Receiver Attributes" do
  hash_source = Controls::Hash.example
  object_source = Controls::Object.example

  mapping = hash_source.keys

  [[hash_source, 'Hash'], [object_source, 'Object']].each do |source_info|

    source = source_info[0]
    source_type = source_info[1]

    context "#{source_type} Source" do
      data_source = SetAttributes::DataSource.build_data_source(source)

      refute(data_source.get_value(:some_attribute).nil?)
      refute(data_source.get_value(:some_other_attribute).nil?)
      refute(data_source.get_value(:yet_another_attribute).nil?)

      receiver = Controls::Object::MissingAttribute.example

      test "Not an error" do
        refute proc { SetAttributes.(receiver, source, include: mapping) } do
          raises_error? SetAttributes::Assign::Error
        end
      end
    end
  end
end
