class SetAttributes
  module Attribute
    class Error < RuntimeError; end

    def self.set(receiver, attribute, value, strict: nil)
      strict ||= false

      setter = :"#{attribute}="

      if receiver.respond_to? setter
        receiver.send setter, value
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
