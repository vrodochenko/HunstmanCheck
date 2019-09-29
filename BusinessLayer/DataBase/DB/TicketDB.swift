//
//  TicketDB.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import CoreData

class TicketsDB: BaseDB<CDMTicket, LMTicket>, TicketsDao {
    init(witContext context: CoreDataProtocol) {
        super.init(witContext: context, adapter: TicketsAdapter())
    }

    func add(ticket: LMTicket) {
        super.insertAll(items: [ticket])
    }

    func get(byId ticketId: String) -> LMTicket? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        request.predicate = NSPredicate(format: "id = %@", ticketId)
        do {
            let items = try self.context.fetch(request) as! [CDMTicket]
            let emmProfiles = items.map {
                self.adapter.map(from: $0)
            }
            return emmProfiles.first
        } catch {
            print("Failed to fetch employees: \(error)")
            return nil
        }
    }
}
