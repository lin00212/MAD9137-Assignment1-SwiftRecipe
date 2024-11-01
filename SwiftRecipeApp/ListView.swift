//
//  ContentView.swift
//  SwiftRecipeApp
//
//  Created by Eason Lin on 30/10/2024.
//

import SwiftUI



struct Recipe: Identifiable {
    let id: UUID = UUID()
    var title: String
    var description: String
    var ingredients: [String]
    var steps: [String]
    var image: String? // later
}

struct ListView: View {
    @State private var isPresented: Bool = false
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredients: [String] = []
    @State private var steps: [String] = []
    @State private var image: Image?
    @State private var ingredientsText: String = ""
    @State private var stepsText: String = ""
    
    @State private var searchResults: [Recipe] = []
    @State private var searchText: String = ""
    
    @State private var showAlert: Bool = false
    @State private var showWarning: Bool = false
    @State private var selectedIndexSet: IndexSet? = nil
    
    
    @ObservedObject var model = RecipeListModel()
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(filteredRecipes) { recipe in
                        NavigationLink {
//                            RecipeDetailView(model:model, recipe: recipe, isPresented: false)
                            RecipeDetailView(model: model, recipe: recipe)
                            
                        } label: {
                            Text(recipe.title)
                                .font(.headline)
                                .foregroundColor(.green)
                                .padding(15)
                        }
                    }
                    .onDelete { indexSet in
                        selectedIndexSet = indexSet
                        showAlert = true
                    }
                }
            }
            
            .searchable(text: $searchText, prompt: "Search by title or ingredient")
            .navigationTitle("Recipes")
            //            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                Form {
                    Section(header: Text("Recipe Details").font(.headline)) {
                        TextField("Title", text: $title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical, 5)

                        TextField("Description", text: $description)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical, 5)
                    }

                    Section(header: Text("Ingredients").font(.headline)) {
                        TextField("Add ingredients", text: $ingredientsText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical, 5)
                    }

                    Section(header: Text("Steps").font(.headline)) {
                        TextField("Add steps", text: $stepsText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical, 5)
                    }
                    
                    Button {
                        addRecipe()
                        isPresented = false
                    } label: {
                        Text("Add Recipe")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding()
                .navigationTitle("New Recipe")
                .navigationBarTitleDisplayMode(.inline)
            }
            .alert("Please fill in all fields before adding the recipe.", isPresented: $showWarning) {
                Button("OK", role: .cancel) { }
            }
        }
        
        .alert("Are you sure you want to delete this recipe?", isPresented: $showAlert) {
            Button("Delete", role: .destructive) {
                if let indexSet = selectedIndexSet {
                    deleteRows(at: indexSet)
                }
            }
            Button("Cancel", role: .cancel) { }
        }
    }
    
    func splitTextToArray(from text: String) -> [String] {
        text.split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
    
    
    func validateFields() -> Bool {
        return !title.isEmpty && !description.isEmpty && !ingredientsText.isEmpty && !stepsText.isEmpty
    }
    
    func addRecipe() {
        if validateFields() {
            let ingredientsArray = splitTextToArray(from: ingredientsText)
            let stepsArray = splitTextToArray(from: stepsText)
            
            let newRecipe = Recipe(title: title, description: description, ingredients: ingredientsArray, steps: stepsArray)
            model.recipes.append(newRecipe)
            clearInputs()
        } else {
            showWarning = true
        }
    }
    
    func deleteRows(at offsets: IndexSet) {
        model.recipes.remove(atOffsets: offsets)
    }
    
    func clearInputs() {
        title = ""
        description = ""
        ingredientsText = ""
        stepsText = ""
    }
    
    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return model.recipes
        }else{
            return model.recipes.filter { recipe in
                recipe.title.localizedStandardContains(searchText) ||
                recipe.ingredients.contains { ingredient in ingredient.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    }
}




#Preview {
    ListView()
}