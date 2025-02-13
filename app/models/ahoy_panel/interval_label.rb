module AhoyPanel
  module IntervalLabel
    extend AttributeParser  # makes the parse_interval method available as a class method

    # Returns a hash with the selected interval label.
    #
    # @param params [Hash] Parameters from the request, expected to include :interval.
    # @return [String] The label for the selected interval.
    def self.selected_label(params:)
      interval_key = parse_interval(params[:interval])
      IntervalConstants::LABELS[interval_key] || interval_key.to_s.capitalize
    end
  end
end
