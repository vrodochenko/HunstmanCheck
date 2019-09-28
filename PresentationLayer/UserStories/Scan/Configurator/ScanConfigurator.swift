//
//  ScanScanConfigurator.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit
import DITranquillity
import ViperMcFlurry

class ScanModuleConfigurator: NSObject {

    func configureModuleForViewInput<T: UIViewController>(viewInput: T) {

        if let viewController = viewInput as? ScanViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ScanViewController) {

        /*let router = ScanRouter()

        let presenter = ScanPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ScanInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter*/
    }
}
/*
extension ScanModuleConfigurator: RamblerViperModuleFactoryProtocol{
    func instantiateModuleTransitionHandler() -> RamblerViperModuleTransitionHandlerProtocol? {
        let storyboard: UIStoryboard = MRegDI.diContainer.resolve(name: )

        return storyboard.instantiateViewController(withIdentifier: )
    }
}*/


