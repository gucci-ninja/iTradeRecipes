# iTradeRecipes

## Our Idea
- Using a user generated database of recipes that calculates a health factor in the backend, we go through what recipes are applicable using itradenetworks dataset for a specific grocery retailer
- the store is ableto generate a flyer that gives end-users a bunch of recipes they can try out using what the store sells as well as a health factor for each and price
- user inputted database of recipes, with a health factor calculated in th backend by weight 
- users can choose ingredients based on dataset provided by itradenetwrok
- on the recipes index page, if user clicks on one, you get an idea of whih store you should go to (metro, fortinos, etc)taking price and distance into account
- your recipe needs chicken and lemon adn chicken is sold at metro but lemon is at fortino
- click on recipe and you get a map that pins all supermarkets with the items
- generate a flyer that advertises recipes + prices


## Implementation
- populate database 
- find out what sellerid means
- reate recipes that will link to an ingredient that exists
- how can we generate a flyer? -> pdf with picture of recipe with items and estimated price
- upload pic for recipe

- recipe resource, name, list of ingredients
- item resource using itradenetwork dataset
- dataset -> seller_id, flyers per date, item, price, 
- flyer object

## Questions for iTradeNetwork
- is product id unique for different stores?
- is it ok to assume the price on the dataset will be reflected in stores

## What we're doing?

### Suhavi
- create resource Item

### Ming
- grooming the dataset
- dataset seeding
- calculating health factor of recipes

### Joseph
- algorithm of how to get recipes for the flyer

### Racheal
- generating a flyer
- making the frontend user friendly