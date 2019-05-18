class Recipe < ApplicationRecord
    serialize :ingredients, Array
end
