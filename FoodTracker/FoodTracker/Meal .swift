//
//  Meal .swift
//  FoodTracker
//
//  Created by Developer on 2018/4/30.
//  Copyright © 2018年 Developer. All rights reserved.
//
import os.log
import UIKit
class Meal: NSObject, NSCoding {

    //MARK: Properties
    var name : String
    var photo : UIImage?
    var rating : Int
    var price : Int = 0
    var productionTime : Int = 0
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        static let price = "price"
        static let productionTime = "productionTime"
    }
    
    //MARK: Initialization
    init?(name : String, photo : UIImage?, rating : Int, price : Int = 0, productionTime : Int = 0) {
        guard !name.isEmpty else {
            return nil
        }
        guard (rating>=0) && (rating<=5) else {
            return nil
        }
        guard (price>=0) else {
            return nil
        }
        guard (productionTime>=0) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
        self.price = price
        self.productionTime = productionTime
    }
    //MARK NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(price, forKey: PropertyKey.price)
        aCoder.encode(productionTime, forKey: PropertyKey.productionTime)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        let price = aDecoder.decodeInteger(forKey: PropertyKey.price)
        
        let productionTime = aDecoder.decodeInteger(forKey: PropertyKey.productionTime)
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating, price: price, productionTime: productionTime)
    }
}
