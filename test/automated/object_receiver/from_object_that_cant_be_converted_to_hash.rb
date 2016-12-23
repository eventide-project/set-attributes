require_relative '../../test_init'

context "Object Receiver" do
  context "From an Object that Can't be Converted to a Hash" do
    receiver = Controls::Object::New.example
    object = Object.new

    test "Is an error" do
      assert proc { SetAttributes.(receiver, object) } do
        raises_error? ArgumentError
      end
    end
  end
end
