require_relative '../../../test_init'

context "Set Attributes" do
  context "Object Source" do
    receiver = Controls::Object::New.example
    object = Controls::Object::MissingAttribute.example

    SetAttributes.(receiver, object)

    test "Sets attributes that correspond to source attribute" do
      assert(receiver.some_attribute == 'some value')
      assert(receiver.some_other_attribute == 'some other value')
    end

    test "Does not set attributes that do not have corresponding source attributes" do
      assert(receiver.yet_another_attribute.nil?)
    end
  end
end
r
