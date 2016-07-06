module TerminalCrontab
  class CrontabTime
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def translate
      return 'invalid' if invalid?
      if list?
        CrontabTimeList.translate(value)
      elsif range?
        CrontabTimeRange.translate(value)
      elsif step?
        CrontabTimeStep.translate(value)
      elsif only_digit?
        CrontabTimeDigit.format(value)
      end
    end

    def invalid?
      !valid?
    end

    def valid?
      (list? ^ range? ^ step? ^ only_digit?) && allowed_values?
    end

    def only_digit?
      value.to_i.to_s == value
    end

    def allowed_values?
      value.gsub(/,|-|\//, '_').split('_').each do |value|
        return false if (value.to_i > 59 || value.to_i < 0)
      end
      true
    end

    def list?
      value.include? ','
    end

    def range?
      value.include? '-'
    end

    def step?
      value.include? '/'
    end
  end
end
