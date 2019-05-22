require_relative '../../test_init'

context "Excluded Attributes" do
  context "Many" do
    receiver = Controls::Object::New.example
    source = Controls::Hash.example

    SetAttributes.(receiver, source, exclude: [
      :some_other_attribute,
      :yet_another_attribute]
    )

    context "Excluded" do
      test "Aren't set" do
        assert(receiver.some_other_attribute.nil?)
        assert(receiver.yet_another_attribute.nil?)
      end
    end

    context "Not Excluded Attributes" do
      test "Are set" do
        assert(receiver.some_attribute == 'some value')
      end
    end
  end
end
