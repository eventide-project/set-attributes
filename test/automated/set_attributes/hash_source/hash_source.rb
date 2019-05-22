require_relative '../../../test_init'

context "Object Receiver" do
  context "From Hash" do
    receiver = Controls::Object::New.example
    source = Controls::Hash::MissingAttribute.example

    SetAttributes.(receiver, source)

    test "Sets attributes that correspond to hash keys" do
      assert(receiver.some_attribute == 'some value')
      assert(receiver.some_other_attribute == 'some other value')
    end

    test "Does not set attributes that do not have corresponding hash keys" do
      assert(receiver.yet_another_attribute.nil?)
    end
  end
end
