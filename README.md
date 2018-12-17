# set_attributes

Set an object's attributes.

## Synopsis

```ruby
require 'set_attribute'

class MyClass
  attr_accessor :my_attribute
end

receiver = MyClass.new
data = { my_attribute: 'value' }

SetAttributes.(receiver, data)

receiver.my_attribute
# => "value"
```

## Usage

Basic usage of `SetAttributes` takes two arguments, the receiver, and the data source. The data argument must be either a hash, or an object that responds to `to_h`. Upon actuation, `SetAttributes` will set all values from the data argument to corresponding attributes on receiver.

## Whitelist / Blacklist

To control what properties are set, the following optional parameters may be specified:

 - `include:` Array of symbols specifying the attributes to be set.
 - `copy:` Alias for `include`.
 - `exclude:` Array of symbols specifying the attributes to be prevented from being set. If a key is present in both `include` and `exclude`, it will be excluded.

```ruby
require 'set_attributes'

class MyClass
  attr_accessor :my_attribute
  attr_accessor :my_other_attribute
end

receiver = MyClass.new
data = { my_attribute: 'value', my_other_attribute: 'value 2' }

SetAttributes.(receiver, data, exclude: [:my_other_attribute])

receiver.my_attribute
# => "value"

receiver.my_other_attribute
# => nil
```

## Strictness

By default, `SetAttributes` will not set an attribute value that the receiver doesn't define. By passing `strict: true` to the actuator, attempting to set an attribute that is not defined will cause `SetAttribute::Attribute::Error` to be raised.

```ruby
require 'set_attributes'

class MyClass
end

receiver = MyClass.new
data = { my_attribute: 'value' }

SetAttributes.(receiver, data, strict: true)
# => raises SetAttribute::Attribute::Error
```

## License

The `set_attributes` library is released under the [MIT License](https://github.com/eventide-project/set-attributes/blob/master/MIT-License.txt).
