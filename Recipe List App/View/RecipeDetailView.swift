//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by James Lem on 12/27/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients, id: \.self) { i in
                        Text("• " + i)
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
        .navigationBarTitle(Text(recipe.name))
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe value so we can preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
