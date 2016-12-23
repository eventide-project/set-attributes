require_relative '../../test_init'

context "Missing Receiver Attributes" do
  receiver = Controls::Object::MissingAttribute.example
  data = Controls::Hash.example

  test "Not an error" do
    refute proc { SetAttributes.(receiver, data) } do
      raises_error?
    end
  end
end
