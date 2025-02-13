module AhoyPanel
  module IntervalConstants
    DEFAULT_INTERVAL = 0

    INTERVALS = {
      0 => :today,
      1 => :yesterday,
      2 => :last_7_days,
      3 => :last_30_days,
      4 => :month_to_date,
      5 => :last_month,
      6 => :year_to_date,
      7 => :last_12_months,
      8 => :all_time,
      9 => :custom
    }.freeze

    LABELS = {
      0 => "Today",
      1 => "Yesterday",
      2 => "Last 7 Days",
      3 => "Last 30 Days",
      4 => "Month to Date",
      5 => "Last Month",
      6 => "Year to Date",
      7 => "Last 12 Months",
      8 => "All Time",
      9 => "Custom Range"
    }.freeze
  end
end
