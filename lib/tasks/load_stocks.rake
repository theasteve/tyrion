require 'csv'

task load_stocks: :environment do
  table = CSV.parse(File.read('./public/stocks.csv'), headers: true)

  table.each do |stock|
    Stock.create({ ticker: stock[0], name: stock[1]})
  end
  puts "Stocks loaded"
end
