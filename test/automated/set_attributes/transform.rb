require_relative '../../test_init'

context "Set Attributes" do
  context "Missing Source Attribute" do
    hash_source = Controls::Hash::Mapped.example
    object_source = Controls::Object::Mapped.example

    mapping = [
      {:an_attribute => :some_attribute},
      :some_other_attribute
    ]

    [[hash_source, 'Hash'], [object_source, 'Object']].each do |source_info|

      source = source_info[0]
      source_type = source_info[1]

      data_source = SetAttributes::DataSource.build_data_source(source)

      refute(data_source[:an_attribute].nil?)
      refute(data_source[:some_other_attribute].nil?)
      assert(data_source[:yet_another_attribute].nil?)

      context "#{source_type} Source" do
        receiver = Controls::Object::New.example

        assert(receiver.some_attribute.nil?)
        assert(receiver.some_other_attribute.nil?)
        assert(receiver.yet_another_attribute.nil?)

        SetAttributes.(receiver, source, include: mapping)

        test "Sets attributes that correspond to the mapped source attribute" do
          assert(receiver.some_attribute == 'some value')
          assert(receiver.some_other_attribute == 'some other value')
        end

        test "Does not set attributes that are not mapped" do
          assert(receiver.yet_another_attribute.nil?)
        end
      end
    end
  end
end
