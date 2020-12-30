module DateHelper
  def self.month_day_year_format(date)
    return Date.strptime(date, '%m/%d/%y') if date

    nil
  end
end
