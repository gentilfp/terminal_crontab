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
      [translate_time, translate_date, translate_weekday].join(' ').strip
    end

    def translate_weekday
      return '' if weekday.star_key?
    end

    def translate_date
      return 'every day' if month.star_key? && date.star_key?
    end

    def translate_time
      return 'at every minute' if minute.star_key? && hour.star_key?
    end
  end
end
