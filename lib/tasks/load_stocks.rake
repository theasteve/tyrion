require 'csv'

task load_stocks: :environment do
  table = CSV.parse(File.read('./public/stocks.csv'), headers: true)

  table.each do |stock|
    Stock.create({ name: stock[0], ticker: stock[1]})
  end
end