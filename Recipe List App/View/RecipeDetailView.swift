//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by James Lem on 12/27/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    @State var ingredientIndex:Int = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 10)
                
                
                // MARK: Serving Size Picker
                VStack (alignment: .leading) {
                    Text("Select Serving Size")
                    Picker("", selection: $ingredientIndex) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                }
                .padding()
               
                
                    
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients) { i in
                        Text("• " + RecipeModel.displayPortion(ingredient: i, defaultServingSize: recipe.servings, userServingSize: ingredientIndex) + " " + i.name.lowercased())
                    }
                }
                .padding(.horizontal, 5)
                    
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                      
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal, 5)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe value so we can preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
