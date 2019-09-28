//
//  BlockBlockRouter.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import ViperMcFlurry

class BlockRouter: BlockRouterInput {
	
    weak var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    init(with controller: BlockViewController) {
        transitionHandler = controller
    }    

    func closeCurrentModule() {
        transitionHandler.closeCurrentModule?(true)
    }

}
