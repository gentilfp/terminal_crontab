module TerminalCrontab
  class CrontabTimeDigit
    def self.ordinalize(value)
      value = value.to_i

      if (11..13).include?(value % 100)
        "#{value}th"
      else
        case value % 10
        when 1; "#{value}st"
        when 2; "#{value}nd"
        when 3; "#{value}rd"
        else    "#{value}th"
        end
      end
    end
  end
end
