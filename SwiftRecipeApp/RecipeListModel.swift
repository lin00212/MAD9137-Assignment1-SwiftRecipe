//
//  RecipeListModel.swift
//  SwiftRecipeApp
//
//  Created by Eason Lin on 30/10/2024.
//

import Foundation

class RecipeListModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    init() {
        recipes = [
            Recipe(
                    title: "Char Siu (BBQ Pork)",
                    description: "Sweet, savory, and smoky barbecued pork, a staple in Hong Kong.",
                    ingredients: ["500g pork shoulder", "3 tbsp hoisin sauce", "2 tbsp soy sauce", "2 tbsp honey", "1 tbsp oyster sauce", "1 tbsp Chinese cooking wine", "1 tsp five-spice powder", "2 cloves garlic, minced"],
                    steps: ["Mix all marinade ingredients together in a bowl.", "Marinate the pork for at least 3 hours or overnight.", "Preheat oven to 180°C (350°F).", "Place pork on a wire rack over a baking tray and roast for 25-30 minutes.", "Brush with extra honey and grill for 5 more minutes until caramelized."],
                    image: "char-siu-bbq-pork"
                ),
                Recipe(
                    title: "Dim Sum Dumplings",
                    description: "Classic steamed dumplings with a flavorful pork and shrimp filling.",
                    ingredients: ["200g ground pork", "100g shrimp, chopped", "2 tbsp soy sauce", "1 tbsp sesame oil", "1 tsp ginger, grated", "1 green onion, chopped", "Wonton wrappers"],
                    steps: ["In a bowl, combine pork, shrimp, soy sauce, sesame oil, ginger, and green onion.", "Place a spoonful of filling in each wonton wrapper and fold to seal.", "Steam dumplings in a bamboo steamer for 10-12 minutes until cooked through."],
                    image: "dim-sum-dumplings"
                ),
                Recipe(
                    title: "Egg Tarts",
                    description: "A sweet pastry with a creamy egg custard filling, popular in Hong Kong bakeries.",
                    ingredients: ["250g puff pastry", "3 eggs", "100ml evaporated milk", "100ml water", "60g sugar", "1 tsp vanilla extract"],
                    steps: ["Roll out puff pastry and cut into rounds, pressing into tart molds.", "In a bowl, mix eggs, milk, water, sugar, and vanilla.", "Pour filling into pastry shells.", "Bake at 180°C (350°F) for 20 minutes until custard is set and pastry is golden."],
                    image: "egg-tarts"
                ),
                Recipe(
                    title: "Hong Kong-Style French Toast",
                    description: "Deep-fried bread with peanut butter filling, served with condensed milk.",
                    ingredients: ["2 slices of bread", "2 tbsp peanut butter", "1 egg", "Milk for soaking", "Butter for frying", "Condensed milk for serving"],
                    steps: ["Spread peanut butter on one slice of bread and top with the other.", "Dip in egg and milk mixture until saturated.", "Pan-fry in butter until golden and crispy.", "Serve with condensed milk drizzled on top."],
                    image: "hong-kong-style-french-toast"
                ),
                Recipe(
                    title: "Beef Brisket Noodle Soup",
                    description: "Rich, flavorful beef brisket stew served over noodles.",
                    ingredients: ["500g beef brisket", "1 onion, chopped", "3 garlic cloves", "2 tbsp soy sauce", "1 tbsp oyster sauce", "1 piece ginger, sliced", "Star anise", "Noodles of choice"],
                    steps: ["Sear beef brisket in a pot until browned.", "Add onion, garlic, soy sauce, oyster sauce, ginger, and star anise.", "Add water to cover and simmer for 2 hours until tender.", "Cook noodles and serve with the beef stew on top."],
                    image: "beef-brisket-noodle-soup"
                ),
                Recipe(
                    title: "Claypot Rice",
                    description: "Rice cooked in a clay pot with a mix of meats and vegetables, served with soy sauce.",
                    ingredients: ["1 cup rice", "1 Chinese sausage, sliced", "100g chicken, diced", "2 tbsp soy sauce", "1 tbsp oyster sauce", "Green onions for garnish"],
                    steps: ["In a clay pot, add rice and water and cook on medium heat.", "Add sausage and chicken halfway through cooking.", "Drizzle with soy sauce and oyster sauce once rice is cooked.", "Garnish with green onions and serve."],
                    image: "claypot-rice"
                ),
                Recipe(
                    title: "Pineapple Bun (Bolo Bao)",
                    description: "A sweet, crunchy-topped bun popular in Hong Kong bakeries.",
                    ingredients: ["300g bread flour", "1 tsp yeast", "150ml milk", "2 tbsp sugar", "1 egg", "Topping: 50g butter, 50g sugar, 1 egg yolk"],
                    steps: ["Mix dough ingredients and knead until smooth, let rise for 1 hour.", "Shape dough into buns and let rise again.", "For topping, cream butter and sugar, add egg yolk.", "Spread topping on buns and bake at 180°C (350°F) for 15-20 minutes."],
                    image: "pineapple-bun"
                ),
                Recipe(
                    title: "Hong Kong Milk Tea",
                    description: "Strong black tea with creamy evaporated milk, a classic Hong Kong beverage.",
                    ingredients: ["2 black tea bags", "250ml water", "50ml evaporated milk", "Sugar to taste"],
                    steps: ["Boil water and steep tea bags for 5-10 minutes.", "Remove tea bags and add evaporated milk.", "Sweeten to taste and serve hot or iced."],
                    image: "hong-kong-milk-tea"
                ),
                Recipe(
                    title: "Roast Goose",
                    description: "Crispy-skinned roast goose with a juicy interior, seasoned with Chinese spices.",
                    ingredients: ["1 whole goose", "2 tbsp soy sauce", "1 tbsp five-spice powder", "1 tbsp honey", "Salt"],
                    steps: ["Rub goose with salt and rinse thoroughly.", "Mix soy sauce, five-spice powder, and honey, and coat goose.", "Roast at 200°C (400°F) for 2 hours until skin is crispy."],
                    image: "roast-goose"
                ),
                Recipe(
                    title: "Sweet and Sour Pork",
                    description: "Crispy pork in a tangy sweet and sour sauce with pineapple and peppers.",
                    ingredients: ["500g pork shoulder, cubed", "1 egg", "Cornstarch for coating", "1/2 cup pineapple", "Bell peppers", "Sauce: 3 tbsp ketchup, 2 tbsp vinegar, 1 tbsp soy sauce, 2 tbsp sugar"],
                    steps: ["Coat pork in egg and cornstarch, then deep fry until golden.", "Sauté pineapple and peppers, add sauce ingredients and bring to a boil.", "Add fried pork to sauce and stir until coated."],
                    image: "sweet-and-sour-pork"
                )
            
        ]
    }
}
