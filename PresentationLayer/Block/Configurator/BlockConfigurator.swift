//
//  BlockBlockConfigurator.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit
import DITranquillity
import ViperMcFlurry

class BlockModuleConfigurator: NSObject {

    func configureModuleForViewInput<T: UIViewController>(viewInput: T) {

        if let viewController = viewInput as? BlockViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: BlockViewController) {

        /*let router = BlockRouter()

        let presenter = BlockPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = BlockInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter*/
    }
}
/*
extension BlockModuleConfigurator: RamblerViperModuleFactoryProtocol{
    func instantiateModuleTransitionHandler() -> RamblerViperModuleTransitionHandlerProtocol? {
        let storyboard: UIStoryboard = MRegDI.diContainer.resolve(name: )

        return storyboard.instantiateViewController(withIdentifier: )
    }
}*/


