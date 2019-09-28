//
//  TicketTicketModuleInput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import ViperMcFlurry

protocol TicketModuleInput: class, RamblerViperModuleInput  {

    func setTicket(_ ticket: LMTicket)
}
