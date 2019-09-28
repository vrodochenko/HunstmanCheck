//
//  TicketsDao.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation

protocol TicketsDao {


    func add(ticket: LMTicket)

    func removeAll()

    func getAll() -> [LMTicket]
}
