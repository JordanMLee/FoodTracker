//
//  Meal.swift
//  FoodTracker
//
//  Created by Restricted on 12/18/17.
//
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage? //image is optional, user doesn't have to specify an image file
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
    
    
    // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
    // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
    //Initialize stored properties.
    
    self.name = name
    self.photo = photo
    self.rating = rating
    
    }
    
}
