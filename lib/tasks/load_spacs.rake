require 'csv'
require 'task_helpers/date_helper'

task load_spacs: :environment do
  table = CSV.parse(File.read('./public/spacs.csv'), headers: true)

  table.each do |spac|
    Spac.create({
      ticker: spac[0],
      name: spac[1],
      target: spac[2],
      definitive_agreement: DateHelper.month_day_year_format(spac[3]),
      preliminary_filing: DateHelper.month_day_year_format(spac[4]),
      first_revision: DateHelper.month_day_year_format(spac[5]),
      second_revision: DateHelper.month_day_year_format(spac[6]),
      third_revision: DateHelper.month_day_year_format(spac[7]),
      definitive_filing: DateHelper.month_day_year_format(spac[8]),
      merger_meeting: DateHelper.month_day_year_format(spac[9]),
      expected_close: spac[10],
      investor_presentation_url: spac[11]
    })
  end
end
