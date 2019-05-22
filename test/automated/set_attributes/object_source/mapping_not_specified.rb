require_relative '../../../test_init'

context "Set Attributes" do
  context "Object Source" do
    context "Mapping Not Specified" do
      source = Controls::Object::MissingAttribute.example
      receiver = Controls::Object::New.example

      test "Is an error" do
        assert proc { SetAttributes.(receiver, source) } do
          raises_error?
        end
      end
    end
  end
end
