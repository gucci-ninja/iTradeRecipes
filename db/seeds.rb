# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('db', 'smalll.csv'))

store_names = ["Metro", "Loblaws", "Nofrills", "Fortinos", "Sobeys", "Walmart", "Costco"]

store_names.each_with_index do |store_name, i|
    store = Store.new
    store.name = store_name
    store.store_id = i
    store.save
end

csv = CSV.parse(csv_text)[1..-1]

stores = 0

csv.each_with_index do |row, i|
    item = Item.new
    item.name = row[6]
    item.price = row[8].to_f
    item.quantity = row[7].to_i
    item.store_id = i % 7
    item.audit_month = Date.parse(row[3]+'-01')
    item.save

    # store = Store.where(store_id: item.store_id).first
    # if !store
    #     puts stores
    #     store = Store.new
    #     store.name = store_names[stores]
    #     store.store_id = item.store_id
    #     store.save
    #     stores += 1
    # end
    # break if stores > store_names.length
end
