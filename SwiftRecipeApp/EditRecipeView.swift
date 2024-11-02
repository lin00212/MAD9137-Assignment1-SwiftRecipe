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
        VStack {
            Text("Edit Recipe")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .presentationBackground(Color.init(.systemGray6))
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
                
                
            }
            HStack{
                
                Button("Save") {
                    // Save changes and dismiss
                    if let index = model.recipes.firstIndex(where: { $0.id == recipe.id }) {
                        
                        model.recipes[index] = recipe
                        
                        callback(recipe)
                        
                        isPresented = false
                    }
                }
                .frame(maxWidth: 120)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                //                .padding()
                //                .frame(maxWidth: .infinity)
                //                .background(Color.blue)
                //                .foregroundColor(.white)
                //                .cornerRadius(10)
                Spacer(minLength: 30)
                Button("Cancel") {
                    isPresented = false
                }
                .frame(maxWidth: 120)
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                //                .padding()
                //                .frame(maxWidth: .infinity)
                //                .background(Color.blue)
                //                .foregroundColor(.white)
                //                .cornerRadius(10)
            }
            .padding(.horizontal,20)
        }
    }
}
#Preview {
    ListView()
}
