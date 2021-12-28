//
//  DataService.swift
//  Recipe List App
//
//  Created by James Lem on 12/27/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the json file, may return nil
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Guard checks if pathstring is not nil, if it is return the empty array
        guard pathString != nil else {
            return[Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
       
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique ids
                for r in recipeData {
                    r.id = UUID()
                }
                
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Recipe]()
    }
    
}
