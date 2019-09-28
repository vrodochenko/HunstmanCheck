//
//  TicketTicketConfigurator.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit
import DITranquillity
import ViperMcFlurry

class TicketModuleConfigurator: NSObject {

    func configureModuleForViewInput<T: UIViewController>(viewInput: T) {

        if let viewController = viewInput as? TicketViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TicketViewController) {

        /*let router = TicketRouter()

        let presenter = TicketPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TicketInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter*/
    }
}
/*
extension TicketModuleConfigurator: RamblerViperModuleFactoryProtocol{
    func instantiateModuleTransitionHandler() -> RamblerViperModuleTransitionHandlerProtocol? {
        let storyboard: UIStoryboard = MRegDI.diContainer.resolve(name: )

        return storyboard.instantiateViewController(withIdentifier: )
    }
}*/


