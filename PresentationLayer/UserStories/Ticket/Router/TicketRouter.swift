//
//  TicketTicketRouter.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import ViperMcFlurry

class TicketRouter: TicketRouterInput {
	
    weak var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    init(with controller: TicketViewController) {
        transitionHandler = controller
    }    

    func closeCurrentModule() {
        transitionHandler.closeCurrentModule?(true)
    }

}
