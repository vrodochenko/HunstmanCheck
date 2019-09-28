//
//  ScanScanRouterInput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation

protocol ScanRouterInput {

    func closeCurrentModule()

    func showTicketModule(with ticket: LMTicket)
}
