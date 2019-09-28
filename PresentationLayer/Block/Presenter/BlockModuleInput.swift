//
//  BlockBlockModuleInput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import ViperMcFlurry

protocol BlockModuleInput: class, RamblerViperModuleInput {

    func setTicket(_ ticket: LMTicket)
}
