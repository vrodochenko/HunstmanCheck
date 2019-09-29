//
//  HistoryHistoryInteractorInput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation

protocol HistoryInteractorInput {

    func getAllTickets() -> [LMTicket]

    func uploadBlk()
}
