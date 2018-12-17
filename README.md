# set_attributes

Set an object's attributes.

## Synopsis

```ruby
require "set_attribute"

class MyClass
  attr_accessor :my_attribute
end

receiver = MyClass.new
data = { my_attribute: "value" }

SetAttributes.(receiver, data)

receiver.my_attribute # => "value"
```

## Usage

Basic usage of `SetAttributes` takes two arguments, the receiver, and the data source. The data argument must be either a hash, or an object that responds to `to_h`. Upon actuation, `SetAttributes` will set all values from the data argument to attributes on receiver.

## Whitelist / Blacklist

To control what properties are set, the following optional parameters may be specified:

 - `include:` Array of symbols specifying the attributes to be set.
 - `copy:` Alias for include.
 - `exclude:` Array of symbols specifying the attributes to be prevented from being set. If a key is present in both `include` and `exclude`, it will be excluded.

```ruby
require "set_attribute"

class MyClass
  attr_accessor :my_attribute
  attr_accessor :my_other_attribute
end

receiver = MyClass.new
data = { my_attribute: "value", my_other_attribute: "value 2" }

SetAttributes.(receiver, data, exclude: [:my_other_attribute])

receiver.my_attribute # => "value"
receiver.my_other_attribute # => "nil"
```

## Strictness

`SetAttributes` will not set a value missing on the receiver. If this is an error condition, you may pass `strict: true` which will cause an error to be raised in that case.

```ruby
require "set_attribute"

class MyClass
end

receiver = MyClass.new
data = { my_attribute: "value" }

SetAttributes.(receiver, data, strict: true) # => raises SetAttribute::Attribute::Error
SetAttributes.(receiver, data) # no error raised
```

## License

The `set_attributes` library is released under the [MIT License](https://github.com/obsidian-btc/set-attributes/blob/master/MIT-License.txt).
