require_relative '../../test_init'

context "Included Attributes" do
  context "One" do
    receiver = Controls::Object::New.example
    source = Controls::Hash.example

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
