require 'csv'

task load_spacs: :environment do
  table = CSV.parse(File.read('./public/spacs.csv'), headers: true)

  table.each do |spac|
    Spac.create({
      ticker: spac[0],
      name: spac[1],
      target: spac[2],
      definitive_agreement: spac[3],
      preliminary_filing: spac[4],
      first_revision: spac[5],
      second_revision: spac[6],
      third_revision: spac[7],
      definitive_filing: spac[8],
      merger_meeting: spac[9],
      expected_close: spac[10],
      investor_presentation_url: spac[11]
    })
  end
end

