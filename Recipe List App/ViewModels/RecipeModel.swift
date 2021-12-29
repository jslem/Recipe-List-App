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
    
    static func displayPortion(ingredient: Ingredient, defaultServingSize: Int, userServingSize: Int) -> String {
        
        var portion = ""
        var numerator = 0
        var denominator = 1
        var wholeNumber = 0
        
        // Pull numerator if it exists
        if ingredient.num != nil {
            numerator = ingredient.num!
            
            // Pull denominator if it exists
            if ingredient.denom != nil {
                denominator = ingredient.denom!
            }
            
            // Normalizing to 1 serving
            denominator *= defaultServingSize
            
            // Adjust based on user setting
            numerator *= userServingSize
            
            // Convert to lowest common denominator
            let divider = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divider
            denominator /= divider
            
            // Convert to whole number + fraction
            if numerator >= denominator {
                wholeNumber = numerator / denominator
                numerator = numerator % denominator
            }
            
            // Write output
            
            if wholeNumber != 0 {
                portion += String(wholeNumber)
                if wholeNumber > 0 && numerator > 0 {
                    portion += " "
                }
            }
            
            if numerator != 0 {
                portion += String(numerator) + "/" + String(denominator)
            }
            
            if ingredient.unit != nil {
                portion += " "
            }

        }

        // Write unit type if it exists
        if ingredient.unit != nil {
            portion += ingredient.unit!
            
            if wholeNumber > 2 || wholeNumber > 1 || numerator > 1 {
                portion += "s"
            }
        }
        
        return portion
    }
    
}
