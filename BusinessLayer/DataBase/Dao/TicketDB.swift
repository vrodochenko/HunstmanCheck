//
//  TicketDB.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation

class TicketsDB: BaseDB<CDMTicket, LMTicket>, TicketsDao {
    init(witContext context: CoreDataProtocol) {
        super.init(witContext: context, adapter: TicketsAdapter())
    }

    func add(ticket: LMTicket) {
        super.insertAll(items: [ticket])
    }
}
