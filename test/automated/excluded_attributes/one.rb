require_relative '../automated_init'

context "Excluded Attributes" do
  context "One" do
    hash_source = Controls::Hash.example
    object_source = Controls::Object.example

    mapping = hash_source.keys

    [[hash_source, 'Hash'], [object_source, 'Object']].each do |source_info|

      source = source_info[0]
      source_type = source_info[1]

      context "#{source_type} Source" do
        receiver = Controls::Object::New.example

        SetAttributes.(receiver, source, include: mapping, exclude: :some_other_attribute)

        context "Excluded" do
          test "Aren't set" do
            assert(receiver.some_other_attribute.nil?)
          end
        end

        context "Not Excluded Attributes" do
          test "Are set" do
            assert(receiver.some_attribute == 'some value')
            assert(receiver.yet_another_attribute == 'yet another value')
          end
        end
      end
    end
  end
end
