//
//  ScanScanRouter.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import ViperMcFlurry

class ScanRouter: ScanRouterInput {

    weak var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!

    init(with controller: ScanViewController) {
        transitionHandler = controller
    }

    func closeCurrentModule() {
        transitionHandler.closeCurrentModule?(true)
    }

    func showTicketModule(with ticket: LMTicket) {
        transitionHandler.openModule?(usingSegue: StoryboardSegue.Main.showTicketInfo.rawValue)?
                .thenChain { moduleInput -> RamblerViperModuleOutput? in

                    (moduleInput as? TicketModuleInput)?.setTicket(ticket)
                    return nil
                }
    }
}
