class SetAttributes
  module Attribute
    class Error < RuntimeError; end

    def self.set(receiver, attribute, value, strict: nil)
      logger = Telemetry::Logger.build self

      strict ||= false

      setter = :"#{attribute}="

      if receiver.respond_to? setter
        receiver.send setter, value
      else
        if strict
          error_msg = "#{receiver} has no setter for #{attribute}"
          logger.error error_msg
          raise Error, error_msg
        else
          logger.opt_debug "#{receiver} has no setter for #{attribute}"
        end
      end

      value
    end
  end
end
