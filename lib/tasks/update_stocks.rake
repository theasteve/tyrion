require 'csv'

task update_stocks: :environment do
  table = CSV.parse(File.read('./public/stocks.csv'), headers: true)

  table.each do |stock|
    s = Stock.find_by({ ticker: stock[0] })

    if s == nil
      Stock.create({ ticker: stock[0], name: stock[1] })
    end
  end
  puts 'Stocks updated'
end
