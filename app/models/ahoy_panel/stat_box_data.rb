module AhoyPanel
  class StatBoxData
    include IntervalConstants

    def initialize(start_at:, end_at:)
      @start_at = start_at
      @end_at = end_at
    end

    attr_reader :start_at, :end_at

    def to_params
      { title: title, data: data, change: change }
    end

    def title
      raise "Must implement"
    end

    def data
      raise "Must implement"
    end

    def change
      raise "Must implement"
    end
  end
end
