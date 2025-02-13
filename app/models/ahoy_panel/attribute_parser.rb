# Description: Module to parse attributes
module AhoyPanel
  module AttributeParser
    def parse_interval(value)
      int_val = value.to_i
      IntervalConstants::INTERVALS.key?(int_val) ? int_val : IntervalConstants::DEFAULT_INTERVAL
    end

    def parse_date(value)
      return nil if value.blank?
      Date.parse(value.to_s)
    rescue ArgumentError
      nil
    end
  end
end
