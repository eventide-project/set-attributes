require_relative '../../../test_init'

context "Set Attributes" do
  context "Object Source" do
    context "Mapped Attributes" do
      source = Controls::Object::Mapped.example
      receiver = Controls::Object::New.example

      SetAttributes.(receiver, source, include: [
        {:an_attribute => :some_attribute},
        :some_other_attribute
      ])

      test "Sets attributes that correspond to the mapped source attribute" do
        assert(receiver.some_attribute == 'some value')
        assert(receiver.some_other_attribute == 'some other value')
      end

      test "Does not set attributes that are not mapped" do
        assert(receiver.yet_another_attribute.nil?)
      end
    end
  end
end
