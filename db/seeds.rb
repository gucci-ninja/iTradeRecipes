# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('db', 'smalll.csv'))

store_names = ["Metro", "Loblaws", "Fortinos"]

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
    item.store_id = i % 3
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

recipes = [
    ["BBQ Brisket","https://www.recipetineats.com/wp-content/uploads/2017/07/Slow-Cooker-BBQ-Beef-Brisket-2-2-1.jpg","beef,worcestershire sauce,barbecue sauce"],
    ["Cajun Chicken Pasta","https://www.yellowblissroad.com/wp-content/uploads/2017/07/Creamy-Cajun-Chicken-Pasta-3-of-11.jpg","penne,tomatoes,mushroom,chicken,olive oil,butter,milk"],
    ["Creamy Garlic Buter Tuscan Shrimp", "https://cafedelites.com/wp-content/uploads/2017/02/Creamy-Garlic-Butter-Tuscan-Shrimp-101.jpg", "shrimp,butter,garlic cloves,yellow onion,white wine,sun dried tomato,milk"],
    ["Crunchy French Onion Chicken", "https://www.recipetineats.com/wp-content/uploads/2018/11/French-Onion-Soup_1.jpg", "onions,egg,boneless chicken breast"],
    ["Asparagus Brie Toast", "https://www.halfbakedharvest.com/wp-content/uploads/2019/04/Crispy-Prosciutto-Asparagus-and-Brie-Toast-6-700x1050.jpg", "olive oil,asparagus"],
    ["Golden Coconut Lentil Soup","https://www.budgetbytes.com/wp-content/uploads/2017/02/Golden-Coconut-and-Lentil-Soup-V.jpg", "olive oil,onion,garlic cloves,ginger"],
    ["Zucchini Fritters", "https://www.recipetineats.com/wp-content/uploads/2018/08/Zucchini-Fritters_9.jpg", "zucchini,salt,eggs,onion,flour"]
]

recipes.each do |r|
    recipe = Recipe.new
    recipe.name =r[0]
    recipe.img_url = r[1]
    recipe.ingredients = r[2]
    recipe.save
end