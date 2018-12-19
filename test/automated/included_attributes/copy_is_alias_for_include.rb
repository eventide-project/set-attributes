require_relative '../../test_init'

context "Included Attributes" do
  context "Many" do
    receiver = Controls::Object::New.example
    data = Controls::Hash.example

    SetAttributes.(receiver, data, copy: [
      :some_other_attribute,
      :yet_another_attribute
    ])

    context "Copied" do
      test "Are set" do
        assert(receiver.some_other_attribute == 'some other value')
        assert(receiver.yet_another_attribute == 'yet another value')
      end
    end

    context "Excluded" do
      test "Aren't set" do
        assert(receiver.some_attribute.nil?)
      end
    end
  end
end
