//
//  RecipeListView.swift
//  Recipe List App
//
//  Created by James Lem on 12/27/21.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view object
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 0) {
                
                Text("Recipe List")
                    .font(.largeTitle)
                    .bold()
                    .padding([.top, .bottom], 40)
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                                
                                NavigationLink(
                                    destination: RecipeDetailView(recipe: r),
                                    label: {
                                        HStack(spacing: 20.0) {
                                            Image(r.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 50, height: 50, alignment: .center)
                                                .clipped()
                                                .cornerRadius(5)
                                            Text(r.name)
                                                .foregroundColor(.black)
                                        }
                                    }
                                )
                        }
                    }
                }
            }
            .padding(.leading)
            .navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
