module AhoyPanel
  class StatBoxData
    def initialize(start_at:, end_at:)
      @start_at = start_at
      @end_at = end_at
    end

    attr_reader :start_at, :end_at

    def data
      raise "Must implement"
    end

    def change
      raise "Must implement"
    end
  end
end
