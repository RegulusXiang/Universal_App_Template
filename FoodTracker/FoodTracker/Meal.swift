//
//  Meal.swift
//  FoodTracker
//
//  Created by xg on 16/1/12.
//  Copyright © 2016年 xg. All rights reserved.
//

//import Foundation
import UIKit

class Meal : NSObject, NSCoding{
    
    //MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
        
    }
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        //a designated initializer, its implementation needs to call to its superclass’s initializer.
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    //MARK:NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        //The required keyword means this initializer must be implemented on every subclass of the class that defines this initializer.
        //convenience initializer because it only applies when there’s saved data to be loaded
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        // Must call designated initilizer.
        self.init(name: name, photo: photo, rating: rating)
        
    }
    
}
