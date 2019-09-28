//
//  ScanScanInteractorOutput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation

protocol ScanInteractorOutput: class {
    func onError(message: String)

    func showTicketInfo(with ticket: LMTicket)
}
