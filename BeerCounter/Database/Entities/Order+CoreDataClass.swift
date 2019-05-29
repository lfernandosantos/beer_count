//
//  Order+CoreDataClass.swift
//  BeerCounter
//
//  Created by Fernando on 28/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Order)
public class Order: NSManagedObject {

    static func save(beers: Int,
                     date: Date,
                     _ persistence: PersistenceManager) {
        
        let order = Order(context: persistence.context)
        order.date = date as NSDate
        order.numberOfBeers = Int16(beers)
        persistence.save()
    }
}
