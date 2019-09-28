//
//  HistoryHistoryInteractor.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

class HistoryInteractor: BaseInteractor, HistoryInteractorInput {

    private let ticketsDao: TicketsDao

    weak var output: HistoryInteractorOutput?

    init(ticketsDao: TicketsDao) {
        self.ticketsDao = ticketsDao
        super.init()
    }

    func getAllTickets() -> [LMTicket] {
        return ticketsDao.getAll()
    }
}
