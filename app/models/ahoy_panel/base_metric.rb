module AhoyPanel
  class BaseMetric < StatBoxData
    include AttributeParser
    include MetricsScope

    # Proxy method to instantiate the object and return its formatted parameters.
    #
    # @param args [Hash] Arguments passed to new (e.g. params, base_collection, date_column)
    # @return [Hash] Formatted output as defined by to_params.
    def self.create_to_params(**args)
      new(**args).to_params
    end
  end
end
