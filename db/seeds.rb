# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('db', 'MasterDF.csv'))

csv = CSV.parse(csv_text)[1..-1]

csv.each do |row|
    item = Item.new
    item.name = row[6]
    item.price = row[8].to_f
    item.quantity = row[7].to_i
    item.store_id = row[1]
    item.audit_month = Date.parse(row[3]+'-01')
    item.save
end