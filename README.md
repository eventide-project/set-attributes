# set_attributes

Set an object's attributes.

## Synopsis

```ruby
require 'set_attribute'

class SomeClass
  attr_accessor :some_attribute
  attr_accessor :some_other_attribute
  attr_accessor :yet_another_attribute
end

receiver = SomeClass.new

data = {
  some_attribute: 'some value',
  some_other_attribute: 'some other value',
  yet_another_attribute: 'yet another value'
}

SetAttributes.(receiver, data)

receiver.some_attribute
# => "some value"

receiver.some_other_attribute
# => "some other value"

receiver.yet_another_attribute
# => "yet another value"
```

## Usage

Basic usage of `SetAttributes` takes two arguments, the receiver, and the data source. The data argument must be either a hash, or an object that responds to `to_h`. Upon actuation, `SetAttributes` will set all values from the data argument to corresponding attributes on receiver.

## Whitelist / Blacklist

To control what properties are set, the following optional parameters may be specified:

 - `include:` Array of symbols specifying the attributes to be set.
 - `copy:` Alias for `include`.
 - `exclude:` Array of symbols specifying the attributes to be prevented from being set. If a key is present in both `include` and `exclude`, it will be excluded.

### Include

```ruby
SetAttributes.(receiver, data, include: [
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

#### Singular Form

If there is only one attribute being included, it can be specified as a single attribute name without enclosing it in an array.

```ruby
SetAttributes.(receiver, data, include: :some_other_attribute)
```

### Exclude

```ruby
SetAttributes.(receiver, data, exclude: [
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
SetAttributes.(receiver, data, exclude: :some_other_attribute)
```

## Strictness

By default, `SetAttributes` will not set an attribute value that the receiver doesn't define. By passing `strict: true` to the actuator, attempting to set an attribute that is not defined will cause `SetAttribute::Attribute::Error` to be raised.

```ruby
require 'set_attributes'

class SomeClass
end

receiver = SomeClass.new
data = { some_attribute: 'some value' }

SetAttributes.(receiver, data, strict: true)
# => raises SetAttribute::Attribute::Error
```

## License

The `set_attributes` library is released under the [MIT License](https://github.com/eventide-project/set-attributes/blob/master/MIT-License.txt).
