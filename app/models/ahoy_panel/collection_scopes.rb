module AhoyPanel
  module CollectionScopes
    def visits_for_period(start_at, end_at)
      Ahoy::Visit.where(started_at: start_at..end_at)
    end

    def events_for_period(start_at, end_at, event_name = 'pageview')
      Ahoy::Event.where(name: event_name, time: start_at..end_at)
    end
  end
end
