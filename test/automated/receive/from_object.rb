require_relative '../../test_init'

context "Object Receiver" do
  context "From an Object" do
    receiver = Controls::Object::New.example
    object = Controls::Object::MissingAttribute.example

    SetAttributes.(receiver, object)

    test "Sets attributes that correspond to hash keys of object converted to hash" do
      assert(receiver.some_attribute == 'some value')
      assert(receiver.some_other_attribute == 'some other value')
    end

    test "Does not set attributes that do not have corresponding hash keys of object converted to hash" do
      assert(receiver.yet_another_attribute.nil?)
    end
  end
end
