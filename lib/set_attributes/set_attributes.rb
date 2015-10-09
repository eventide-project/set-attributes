class SetAttributes
  dependency :logger, Telemetry::Logger

  attr_reader :receiver
  attr_reader :data
  attr_writer :log_black_list_regex

  def log_black_list_regex
    @log_black_list_regex ||= Attribute::Defaults.log_black_list_regex
  end

  def initialize(receiver, data)
    @receiver = receiver
    @data = data
  end

  def self.build(receiver, data, log_black_list_regex: nil)
    logger.trace "Building (Receiver: #{receiver})"

    unless data.respond_to? :to_h
      raise ArgumentError, "#{data} can't be used to set attributes. It can't be converted to Hash."
    end

    unless data.is_a? Hash
      data = data.to_h
    end

    new(receiver, data).tap do |instance|
      instance.log_black_list_regex = log_black_list_regex
      Telemetry::Logger.configure instance
      logger.debug "Built (Receiver: #{receiver}, Black List Regex: #{instance.log_black_list_regex})"
    end
  end

  def self.call(receiver, data, log_black_list_regex: nil)
    instance = build(receiver, data, log_black_list_regex: log_black_list_regex)
    instance.()
  end
  class << self; alias :! :call; end # TODO: Remove deprecated actuator [Kelsey, Thu Oct 08 2015]

  def call
    data.each do |attribute, value|
      Attribute.set(receiver, attribute, value, log_black_list_regex)
    end
    receiver
  end
  alias :! :call # TODO: Remove deprecated actuator [Kelsey, Thu Oct 08 2015]

  def self.logger
    @logger ||= Telemetry::Logger.get self
  end
end
