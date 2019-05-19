require_relative '../../test_init'

context "Missing Receiver Attributes" do
  context "Strict" do
    receiver = Controls::Object::MissingAttribute.example
    data = Controls::Hash.example

    test "Is an error" do
      assert proc { SetAttributes.(receiver, data, strict: true) } do
        raises_error? SetAttributes::Set::Error
      end
    end
  end
end
