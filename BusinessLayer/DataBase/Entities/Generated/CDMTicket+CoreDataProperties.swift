//
//  CDMTicket+CoreDataProperties.swift
//  
//
//  Created by Арабаджиян Артем on 28/09/2019.
//
//

import Foundation
import CoreData


extension CDMTicket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMTicket> {
        return NSFetchRequest<CDMTicket>(entityName: "CDMTicket")
    }

    @NSManaged public var fio: String!
    @NSManaged public var dob: NSDate!
    @NSManaged public var startTrip: NSDate!
    @NSManaged public var finishTrip: NSDate!
    @NSManaged public var passpotData: String!

}
