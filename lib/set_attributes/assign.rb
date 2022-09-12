class SetAttributes
  module Assign
    class Error < RuntimeError; end

    def self.call(receiver, attribute, value, strict: nil)
      strict = true if strict.nil?

      setter = :"#{attribute}="

      if receiver.respond_to?(setter)
        receiver.public_send(setter, value)
      else
        if strict
          error_msg = "#{receiver} has no setter for #{attribute}"
          raise Error, error_msg
        end
      end

      value
    end
  end
end
