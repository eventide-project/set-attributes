class SetAttributes
  module Attribute
    def self.set(receiver, attribute, value, log_black_list_regex=nil)
      logger = Logger.get self

      setter = :"#{attribute}="

      if log_black_list_regex && !(attribute =~ log_black_list_regex).nil?
        log_value = '(value cannot be logged)'
      else
        log_value = value
      end

      if receiver.respond_to? setter
        logger.trace "Setting #{attribute} to #{log_value}"

        receiver.send setter, value

        logger.debug "Set #{attribute} to #{log_value}"
      else
        logger.warn "#{receiver} has no setter for #{attribute}"
      end

      value
    end
  end
end
