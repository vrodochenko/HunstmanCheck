//
//  CDMTicket+CoreDataProperties.swift
//  
//
//  Created by Арабаджиян Артем on 29/09/2019.
//
//

import Foundation
import CoreData


extension CDMTicket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMTicket> {
        return NSFetchRequest<CDMTicket>(entityName: "CDMTicket")
    }
    @NSManaged public var id: String!
    @NSManaged public var dob: NSDate!
    @NSManaged public var finishTrip: NSDate!
    @NSManaged public var fio: String!
    @NSManaged public var passpotData: String!
    @NSManaged public var startTrip: NSDate!

}
