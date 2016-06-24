module TerminalCrontab
  class Human
    attr_reader :minute, :hour, :date, :month, :weekday

    def initialize(minute, hour, date, month, weekday)
      @minute  = minute
      @hour    = hour
      @date    = date
      @month   = month
      @weekday = weekday
    end

    def translate
      [
        'at',
        translate_minute,
        'of',
        translate_hour,
        translate_day,
        translate_month,
        translate_weekday
      ].join(' ').strip
    end

    def translate_weekday
      return '' if weekday.star_key?
    end

    def translate_month
      return '' if date.star_key?
    end

    def translate_day
      return 'every day' if month.star_key?
    end

    def translate_minute
      return 'every minute' if minute.star_key?
    end

    def translate_hour
      return 'every hour' if hour.star_key?
    end
  end
end
