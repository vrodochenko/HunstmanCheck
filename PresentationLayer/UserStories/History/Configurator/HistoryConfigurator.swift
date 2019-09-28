//
//  HistoryHistoryConfigurator.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit
import DITranquillity
import ViperMcFlurry

class HistoryModuleConfigurator: NSObject {

    func configureModuleForViewInput<T: UIViewController>(viewInput: T) {

        if let viewController = viewInput as? HistoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: HistoryViewController) {

        /*let router = HistoryRouter()

        let presenter = HistoryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = HistoryInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter*/
    }
}
/*
extension HistoryModuleConfigurator: RamblerViperModuleFactoryProtocol{
    func instantiateModuleTransitionHandler() -> RamblerViperModuleTransitionHandlerProtocol? {
        let storyboard: UIStoryboard = MRegDI.diContainer.resolve(name: )

        return storyboard.instantiateViewController(withIdentifier: )
    }
}*/


