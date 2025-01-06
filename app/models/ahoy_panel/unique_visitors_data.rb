module AhoyPanel
  class UniqueVisitorsData < StatBoxData
    def to_params
      { title:, data:, change: }
    end

    def title
      "Unique Visitors"
    end

    def data
      @data ||= Ahoy::Visit.where(started_at: start_at..end_at).size
    end

    def change
      return @change if defined?(@change)

      # TODO figure out a way to calculate start_count, i.e., query for the data the day before

      start_count = Ahoy::Visit.where(started_at: start_at).size
      end_count = Ahoy::Visit.where(started_at: end_at).size

      @change = end_count - start_count
    end
  end
end
