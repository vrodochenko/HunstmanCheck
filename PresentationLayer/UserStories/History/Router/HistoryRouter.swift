//
//  HistoryHistoryRouter.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import ViperMcFlurry

class HistoryRouter: HistoryRouterInput {
	
    weak var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    init(with controller: HistoryViewController) {
        transitionHandler = controller
    }    

    func closeCurrentModule() {
        transitionHandler.closeCurrentModule?(true)
    }

    func showTicketInfoModule(with ticket: LMTicket, moduleOutput: TicketModuleOutput) {
        transitionHandler.openModule?(usingSegue: StoryboardSegue.Main.showTicketInfo.rawValue)?
                .thenChain { moduleInput -> RamblerViperModuleOutput? in

                    (moduleInput as? TicketModuleInput)?.setTicket(ticket)

                    return moduleOutput
                }
    }
}
