require_relative '../../test_init'

context "Included Attributes" do
  context "One" do
    hash_source = Controls::Hash.example
    object_source = Controls::Object.example

    [[hash_source, 'Hash'], [object_source, 'Object']].each do |source_info|

      source = source_info[0]
      source_type = source_info[1]

      context "#{source_type} Source" do
        receiver = Controls::Object::New.example

        SetAttributes.(receiver, source, include: :some_other_attribute)

        context "Included" do
          test "Are set" do
            assert(receiver.some_other_attribute == 'some other value')
          end
        end

        context "Excluded" do
          test "Aren't set" do
            assert(receiver.some_attribute.nil?)
            assert(receiver.yet_another_attribute.nil?)
          end
        end
      end
    end
  end
end
