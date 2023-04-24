//
//  BoredActivity+CoreDataProperties.swift
//  BoredData
//
//  Created by Nhi Huynh on 4/11/23.
//
//

import Foundation
import CoreData


extension BoredActivity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BoredActivity> {
        return NSFetchRequest<BoredActivity>(entityName: "BoredActivity")
    }

    @NSManaged public var accessibility: Double
    @NSManaged public var activity: String?
    @NSManaged public var participants: Int16
    @NSManaged public var price: Double
    @NSManaged public var type: String?

}
