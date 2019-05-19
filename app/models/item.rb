class Item < ApplicationRecord

    # My attempt at making the description more readable
    # def self.scrubbed
    #     Item.all.each do |p|
    # end

    def self.get_price(item, store)
        item = Item.where(store_id: store).where('name LIKE ?', "%#{item.upcase}%").first
        (item.price/item.quantity).round(2)
    end
end
