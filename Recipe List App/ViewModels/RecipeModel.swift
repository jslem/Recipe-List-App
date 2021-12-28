//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by James Lem on 12/27/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
    
}
