//
//  BoredActivity+CoreDataClass.swift
//  BoredData
//
//  Created by Nhi Huynh on 4/11/23.
//
//

import Foundation
import CoreData

// Extend Decodable so you this class can do double duty, used for fetching the
// API AND for CoreData

@objc(BoredActivity)
public class BoredActivity: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case activity = "activity"
        case accessibility = "howEasy"
        case type = "type"
        case participants = "persons"
        case price = "cost"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        // Got this from Clara J: github.com/claraj/github_core_data_ios/
        
        // Check that the decoder has a context in the userInfo dictionary. See also extension to CodingUserInfoKey, below
        guard let context = decoder.userInfo[CodingUserInfoKey.context!] else { fatalError("Provide a NSManagedObjectContext") }
        guard let managedObjectContext = context as? NSManagedObjectContext else { fatalError("Provide a NSManagedObjectContext") }
        guard let entity = NSEntityDescription.entity(forEntityName: "BoredActivity", in: managedObjectContext) else { fatalError("No UserEntity") }
        
        // Call standard NSManagedEntity initializer
        self.init(entity: entity, insertInto: managedObjectContext)
        
        // The container holds all of the JSON data
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // decode attributes
        self.activity = try container.decodeIfPresent(String.self, forKey: .activity)
        self.accessibility = try container.decodeIfPresent(Double.self, forKey: .accessibility) ?? 0.0
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.participants = try container.decodeIfPresent(Int16.self, forKey: .participants) ?? 0
        self.price = try container.decodeIfPresent(Double.self, forKey: .price) ?? 0.0
    }
}
    
    
    extension CodingUserInfoKey {
        static let context = CodingUserInfoKey(rawValue: "context")
    }
        

