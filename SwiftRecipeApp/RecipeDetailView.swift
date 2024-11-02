//
//  RecipeDetailView.swift
//  SwiftRecipeApp
//
//  Created by Eason Lin on 30/10/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var model: RecipeListModel
    @State var recipe: Recipe
    @State var isPresented: Bool = false
    @State var showAlert: Bool = false
    
    @Environment(\.presentationMode) var presentationMode // go back to the list
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                AsyncImage(url: URL(string:recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white.opacity(0.5))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                VStack{
                    
                
                // Recipe Title
                Text(recipe.title)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Recipe Description
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(recipe.description)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                }
                .padding(.vertical)
                
                // Recipe Ingredients
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients")
                        .font(.title3)
                        .fontWeight(.semibold)
                        
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                            .padding(.leading, 10)

                    }
                    
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                    
                
                // Recipe Steps
                VStack(alignment: .leading, spacing: 10) {
                    Text("Steps")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    ForEach(recipe.steps.indices, id: \.self) { index in
                        Text("\(index + 1). \(recipe.steps[index])")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .font(.body)
                    .padding(.horizontal)
                }
                
                // Delete Button
                
                Button(action: {
                    showAlert = true
                }) {
                    Text("Delete Recipe")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .alert("Are you sure you want to delete this recipe?", isPresented: $showAlert) {
                    Button("Delete", role: .destructive) {
                        deleteRecipe()
                        
                    }
                    Button("Cancel", role: .cancel) { }
                }
                }.padding(.horizontal)
        }
        
            
        }
        .navigationBarItems(trailing: Button("Edit") {
            // Handle Edit Action
            isPresented = true
        })
        .sheet(isPresented: $isPresented) {
            EditRecipeView(
                recipe: recipe,
                model: model,
                isPresented:$isPresented,
                callback:{ r in
                    recipe = r
            })
        }
    }
    

        
    
    func deleteRecipe() {
        if let index = model.recipes.firstIndex(where: { $0.id == recipe.id }) {
            model.recipes.remove(at: index)
            presentationMode.wrappedValue.dismiss()
        }
    }
}


struct DemoView: View{
    
    @ObservedObject var model: RecipeListModel = RecipeListModel()
    var recipe: Recipe = Recipe(
        title: "title", description: "sadf", ingredients: [], steps: [], image: ""
    )

    
    var body: some View {
        RecipeDetailView(model: model, recipe: recipe)
    }
}
    


#Preview {
    ListView()
}

    
