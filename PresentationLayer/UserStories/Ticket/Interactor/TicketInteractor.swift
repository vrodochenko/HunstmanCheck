//
//  TicketTicketInteractor.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation

class TicketInteractor: BaseInteractor, TicketInteractorInput {

    private let ticketsDao: TicketsDao

    weak var output: TicketInteractorOutput?

    init(ticketsBaseDao: TicketsDao) {
        self.ticketsDao = ticketsBaseDao
        super.init()
    }

    func saveTicket(_ ticket: LMTicket) {
        HistoryPresenter.TICKETS.append(ticket)

        NotificationCenter
                .default
                .post(name: .createTicket, object: nil)
    }
}
