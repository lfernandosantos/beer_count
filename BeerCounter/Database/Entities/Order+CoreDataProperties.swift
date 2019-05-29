//
//  Order+CoreDataProperties.swift
//  BeerCounter
//
//  Created by Fernando on 28/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var numberOfBeers: Int16
}
