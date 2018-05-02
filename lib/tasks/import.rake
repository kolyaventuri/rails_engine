require 'csv'

namespace :import do
  desc 'Seed The Database'
  task all: :environment do
    load_merchants
    load_transactions
    load_customers
    load_items
  end

  def load_merchants
    CSV.foreach('db/csv/merchants.csv', headers: true, header_converters: :symbol) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  def load_transactions
    CSV.foreach('db/csv/transactions.csv', headers: true, header_converters: :symbol) do |row|
      Transaction.create!(row.to_hash)
    end
  end

  def load_customers
    CSV.foreach('db/csv/customers.csv', headers: true, header_converters: :symbol) do |row|
      Customer.create!(row.to_hash)
    end
  end

  def load_items
    CSV.foreach('db/csv/items.csv', headers: true, header_converters: :symbol) do |row|
      Item.create!(row.to_hash)
    end
  end

end