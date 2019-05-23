# set_attributes

Set an object's attributes from a source object or hash.

## Usage

`SetAttributes` takes two arguments, the receiver, and the source. The source argument can be either a hash or an object. Upon actuation, `SetAttributes` will assign all values from the source to the corresponding attributes on receiver.

```ruby
require 'set_attribute'

class SomeClass
  attr_accessor :some_attribute
  attr_accessor :some_other_attribute
  attr_accessor :yet_another_attribute
end

receiver = SomeClass.new
```

### Hash Source

```ruby
source = {
  some_attribute: 'some value',
  some_other_attribute: 'some other value',
  yet_another_attribute: 'yet another value'
}

SetAttributes.(receiver, source)

receiver.some_attribute
# => "some value"

receiver.some_other_attribute
# => "some other value"

receiver.yet_another_attribute
# => "yet another value"
```

### Object Source

```ruby
source = SomeClass.new

source.some_attribute = 'some value',
source.some_other_attribute = 'some other value'
source.yet_another_attribute = 'yet another value'

SetAttributes.(receiver, source, include: [
  :some_attribute,
  :some_other_attribute,
  :yet_another_attribute
])

receiver.some_attribute
# => "some value"

receiver.some_other_attribute
# => "some other value"

receiver.yet_another_attribute
# => "yet another value"
```

When using an object data source, the list of attributes to be copied must be specified or else an error will be raise.

```ruby
SetAttributes.(receiver, source)
# => SetAttributes::DataSource::Object::Error
```

## Whitelist / Blacklist

To control what properties are set, the following optional parameters may be specified:

 - `include:` Array of symbols specifying the attributes to be set.
 - `copy:` Alias for `include`.
 - `exclude:` Array of symbols specifying the attributes to be prevented from being set. If a key is present in both `include` and `exclude`, it will be excluded.

### Include (or Copy)

```ruby
SetAttributes.(receiver, source, include: [
  :some_other_attribute,
  :yet_another_attribute
])

receiver.some_attribute
# => nil

receiver.some_other_attribute
# => "some other value"

receiver.yet_another_attribute
# => "yet another value"
```

The `:copy` parameter can also be used instead of `:include`.

```ruby
SetAttributes.(receiver, source, copy: [
  :some_other_attribute,
  :yet_another_attribute
])

#### Singular Form

If there is only one attribute being included, it can be specified as a single attribute name without enclosing it in an array.

```ruby
SetAttributes.(receiver, source, include: :some_other_attribute)
```

### Exclude

```ruby
SetAttributes.(receiver, source, exclude: [
  :some_other_attribute,
  :yet_another_attribute
])

receiver.some_attribute
# => "some value"

receiver.some_other_attribute
# => nil

receiver.yet_other_attribute
# => nil
```

#### Singular Form

If there is only one attribute being excluded, it can be specified as a single attribute name without enclosing it in an array.

```ruby
SetAttributes.(receiver, source, exclude: :some_other_attribute)
```

## Strictness

By default, `SetAttributes` will not set an attribute value that the receiver doesn't define. By passing `strict: true` to the actuator, attempting to set an attribute that is not defined will cause `SetAttribute::Attribute::Error` to be raised.

```ruby
require 'set_attributes'

source = {
  some_random_attribute: 'some value'
}

SetAttributes.(receiver, source, strict: true)
# => raises SetAttributes::Assign::Error
```

## License

The `set_attributes` library is released under the [MIT License](https://github.com/eventide-project/set-attributes/blob/master/MIT-License.txt).
