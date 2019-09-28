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

    func showBlockModule(with ticket: LMTicket, moduleOutput: BlockModuleOutput) {
        transitionHandler.openModule?(usingSegue: StoryboardSegue.Main.showBlackListSegue.rawValue)?
                .thenChain { moduleInput -> RamblerViperModuleOutput? in

                    (moduleInput as? BlockModuleInput)?.setTicket(ticket)
                    return moduleOutput
                }
    }
}
