module TerminalCrontab
  class Converter
    def self.to_human(minute='*', hour='*', date='*', month='*', weekday='*')
      Human.new(minute, hour, date, month, weekday).translate
    end

    def self.to_crontab(sentence='at every minute')
      return '* * * * *'
    end
  end
end
