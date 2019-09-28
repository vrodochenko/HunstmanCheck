//
//  HistoryHistoryRouterInput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation

protocol HistoryRouterInput {

    func closeCurrentModule()

    func showTicketInfoModule(with ticket: LMTicket, moduleOutput: TicketModuleOutput)
}
