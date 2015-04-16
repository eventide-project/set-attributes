class SetAttributes
  dependency :logger

  attr_reader :receiver
  attr_reader :params
  attr_reader :log_black_list_regex

  def initialize(receiver, params, log_black_list_regex=nil)
    @receiver = receiver
    @params = params
    @log_black_list_regex = log_black_list_regex || Attribute::Defaults.log_black_list_regex
  end

  def self.build(receiver, params, log_black_list_regex=nil)
    logger = Logger.get self
    logger.trace "Building (Receiver: #{receiver}, Black List Regex: #{log_black_list_regex})"

    new(receiver, params, log_black_list_regex).tap do |instance|
      Logger.configure instance
      logger.debug "Built (Receiver: #{receiver}, Black List Regex: #{log_black_list_regex})"
    end
  end

  def self.!(receiver, params, log_black_list_regex=nil)
    instance = build(receiver, params, log_black_list_regex)
    instance.!
  end

  def !
    params.each do |attribute, value|
      Attribute.set(receiver, attribute, value, log_black_list_regex)
    end
    receiver
  end
end
