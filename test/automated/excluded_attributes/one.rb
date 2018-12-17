require_relative '../../test_init'

context "Excluded Attributes" do
  context "One" do
    receiver = Controls::Object::New.example
    data = Controls::Hash.example

    SetAttributes.(receiver, data, exclude: :some_other_attribute)

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
