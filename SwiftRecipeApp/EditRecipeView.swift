//
//  EditRecipeView.swift
//  SwiftRecipeApp
//
//  Created by Eason Lin on 31/10/2024.
//

import SwiftUI

struct EditRecipeView: View {
    @State var recipe: Recipe
    var model: RecipeListModel
    @Binding var isPresented: Bool
    var callback: ((_ recipe:Recipe) -> Void) = { _ in }

    var body: some View {
        Form {
            Section(header: Text("Recipe Details").font(.headline)) {
                TextField("Title", text: $recipe.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Description", text: $recipe.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            Section(header: Text("Ingredients").font(.headline)) {
                TextField("Add ingredients", text: Binding(
                    get: { recipe.ingredients.joined(separator: ", ") },
                    set: { recipe.ingredients = $0.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) } }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            Section(header: Text("Steps").font(.headline)) {
                TextField("Add steps", text: Binding(
                    get: { recipe.steps.joined(separator: ", ") },
                    set: { recipe.steps = $0.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) } }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            Button("Save") {
                // Save changes and dismiss
                print("checkpoint1")
                if let index = model.recipes.firstIndex(where: { $0.id == recipe.id }) {
                    print("checkpoint1.5")
                    model.recipes[index] = recipe
                    
                    callback(recipe)
                    
                    isPresented = false
                }
                print("checkpoint2")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ListView()
}
