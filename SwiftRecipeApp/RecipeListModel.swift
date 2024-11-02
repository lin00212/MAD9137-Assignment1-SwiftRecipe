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
                    image: "https://www.discoverhongkong.com/content/dam/dhk/intl/explore/dining/learn-to-make-hk-sweet-bbq-pork/learn-to-make-hk-sweet-bbq-pork-1920x1080.jpg"
                ),
                Recipe(
                    title: "Dim Sum Dumplings",
                    description: "Classic steamed dumplings with a flavorful pork and shrimp filling.",
                    ingredients: ["200g ground pork", "100g shrimp, chopped", "2 tbsp soy sauce", "1 tbsp sesame oil", "1 tsp ginger, grated", "1 green onion, chopped", "Wonton wrappers"],
                    steps: ["In a bowl, combine pork, shrimp, soy sauce, sesame oil, ginger, and green onion.", "Place a spoonful of filling in each wonton wrapper and fold to seal.", "Steam dumplings in a bamboo steamer for 10-12 minutes until cooked through."],
                    image: "https://cdn.ready-market.com.tw/21cd62de/Templates/pic/ANKO-Dumpling-1200x1200.jpg?v=a76bc5e5"
                ),
                Recipe(
                    title: "Egg Tarts",
                    description: "A sweet pastry with a creamy egg custard filling, popular in Hong Kong bakeries.",
                    ingredients: ["250g puff pastry", "3 eggs", "100ml evaporated milk", "100ml water", "60g sugar", "1 tsp vanilla extract"],
                    steps: ["Roll out puff pastry and cut into rounds, pressing into tart molds.", "In a bowl, mix eggs, milk, water, sugar, and vanilla.", "Pour filling into pastry shells.", "Bake at 180°C (350°F) for 20 minutes until custard is set and pastry is golden."],
                    image: "https://tokyo-kitchen.icook.network/uploads/recipe/cover/204843/0015e1242fd8a98a.jpg"
                ),
                Recipe(
                    title: "Hong Kong-Style French Toast",
                    description: "Deep-fried bread with peanut butter filling, served with condensed milk.",
                    ingredients: ["2 slices of bread", "2 tbsp peanut butter", "1 egg", "Milk for soaking", "Butter for frying", "Condensed milk for serving"],
                    steps: ["Spread peanut butter on one slice of bread and top with the other.", "Dip in egg and milk mixture until saturated.", "Pan-fry in butter until golden and crispy.", "Serve with condensed milk drizzled on top."],
                    image: "https://tokyo-kitchen.icook.network/uploads/recipe/cover/449147/a2d15b0a66c7419a.jpg"
                ),
                Recipe(
                    title: "Beef Brisket Noodle Soup",
                    description: "Rich, flavorful beef brisket stew served over noodles.",
                    ingredients: ["500g beef brisket", "1 onion, chopped", "3 garlic cloves", "2 tbsp soy sauce", "1 tbsp oyster sauce", "1 piece ginger, sliced", "Star anise", "Noodles of choice"],
                    steps: ["Sear beef brisket in a pot until browned.", "Add onion, garlic, soy sauce, oyster sauce, ginger, and star anise.", "Add water to cover and simmer for 2 hours until tender.", "Cook noodles and serve with the beef stew on top."],
                    image: "https://cdn.hk01.com/di/media/images/dw/20230922/781973075221549056198063.jpeg/KL28NT2FyloS4LudV37Fx2Fkq-VWb4zd7rfYJu632CY?v=w1920"
                ),
                Recipe(
                    title: "Claypot Rice",
                    description: "Rice cooked in a clay pot with a mix of meats and vegetables, served with soy sauce.",
                    ingredients: ["1 cup rice", "1 Chinese sausage, sliced", "100g chicken, diced", "2 tbsp soy sauce", "1 tbsp oyster sauce", "Green onions for garnish"],
                    steps: ["In a clay pot, add rice and water and cook on medium heat.", "Add sausage and chicken halfway through cooking.", "Drizzle with soy sauce and oyster sauce once rice is cooked.", "Garnish with green onions and serve."],
                    image: "https://cdn.hk01.com/di/media/images/cis/5df05ffec0c9dc116d9c34c1.jpg/BiefbLPEpkTqF5foCy8an_veTvsY4GWnQLXMN0C1zDc"
                ),
                Recipe(
                    title: "Pineapple Bun (Bolo Bao)",
                    description: "A sweet, crunchy-topped bun popular in Hong Kong bakeries.",
                    ingredients: ["300g bread flour", "1 tsp yeast", "150ml milk", "2 tbsp sugar", "1 egg", "Topping: 50g butter, 50g sugar, 1 egg yolk"],
                    steps: ["Mix dough ingredients and knead until smooth, let rise for 1 hour.", "Shape dough into buns and let rise again.", "For topping, cream butter and sugar, add egg yolk.", "Spread topping on buns and bake at 180°C (350°F) for 15-20 minutes."],
                    image: "https://images1.epochhk.com/pictures/179875/20140328_Bread_Corner_Melon_Bread@1200x1200.jpg"
                ),
                Recipe(
                    title: "Hong Kong Milk Tea",
                    description: "Strong black tea with creamy evaporated milk, a classic Hong Kong beverage.",
                    ingredients: ["2 black tea bags", "250ml water", "50ml evaporated milk", "Sugar to taste"],
                    steps: ["Boil water and steep tea bags for 5-10 minutes.", "Remove tea bags and add evaporated milk.", "Sweeten to taste and serve hot or iced."],
                    image: "https://media.timeout.com/images/105638926/image.jpg"
                ),
                Recipe(
                    title: "Roast Goose",
                    description: "Crispy-skinned roast goose with a juicy interior, seasoned with Chinese spices.",
                    ingredients: ["1 whole goose", "2 tbsp soy sauce", "1 tbsp five-spice powder", "1 tbsp honey", "Salt"],
                    steps: ["Rub goose with salt and rinse thoroughly.", "Mix soy sauce, five-spice powder, and honey, and coat goose.", "Roast at 200°C (400°F) for 2 hours until skin is crispy."],
                    image: "https://dw-media.tkww.hk/dams/dwproduct/image/202205/30/62945d37e4b0262b80968ac1.jpg"
                ),
                Recipe(
                    title: "Sweet and Sour Pork",
                    description: "Crispy pork in a tangy sweet and sour sauce with pineapple and peppers.",
                    ingredients: ["500g pork shoulder, cubed", "1 egg", "Cornstarch for coating", "1/2 cup pineapple", "Bell peppers", "Sauce: 3 tbsp ketchup, 2 tbsp vinegar, 1 tbsp soy sauce, 2 tbsp sugar"],
                    steps: ["Coat pork in egg and cornstarch, then deep fry until golden.", "Sauté pineapple and peppers, add sauce ingredients and bring to a boil.", "Add fried pork to sauce and stir until coated."],
                    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx74w24Xv5weXYIdik6vbhEJLbF0tMw7LHVg&s"
                )
            
        ]
    }
}
