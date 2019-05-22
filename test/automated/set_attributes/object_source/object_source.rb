require_relative '../../../test_init'

context "Set Attributes" do
  context "Object Source" do
    source = Controls::Object::MissingAttribute.example

    refute(source.some_attribute.nil?)
    refute(source.some_other_attribute.nil?)

    receiver = Controls::Object::New.example

    assert(receiver.some_attribute.nil?)
    assert(receiver.some_other_attribute.nil?)
    assert(receiver.yet_another_attribute.nil?)

    include = [
      :some_attribute,
      :some_other_attribute
    ]

    SetAttributes.(receiver, source, include: include)

    test "Sets attributes that correspond to the mapped source attribute" do
      assert(receiver.some_attribute == 'some value')
      assert(receiver.some_other_attribute == 'some other value')
    end

    test "Does not set attributes that are not mapped" do
      assert(receiver.yet_another_attribute.nil?)
    end
  end
end
