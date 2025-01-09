module AhoyPanel
  class TotalPageviewsData < StatBoxData
    def title
      "Total Pageviews"
    end

    def data
      return @data if defined?(@data)

      @data ||= Ahoy::Visit.where(started_at: start_at..end_at).size
    end

    def change
      return @change if defined?(@change)

      start_back_at = if start_at.to_date == end_at.to_date
                        start_back_days = 1
                      else
                        (end_at.to_date - start_at.to_date).to_i
                      end

      start_range = (start_at - start_back_at.days)..(end_at - start_back_at.days)
      end_range = start_at..end_at

      start_count = Ahoy::Visit.where(started_at: start_range).size
      end_count = Ahoy::Visit.where(started_at: end_range).size

      @change = ((end_count - start_count).to_f / (start_count.zero? ? 1 : start_count) * 100).to_i
    end
  end
end
