//
//  ScanScanAssembly.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation
import DITranquillity

class ScanFramework: DIFramework {
    static func load(container: DIContainer) {
        container
                .append(part: ScanRouterPart.self)
                .append(part: ScanInteractorsPart.self)
                .append(part: ScanPresentersPart.self)
                .append(part: ScanViewPart.self)
    }
}

fileprivate class ScanViewPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(ScanViewController.self)
                .injection(cycle: true) {
                    $0.output = $1
                }
                .lifetime(.objectGraph)
    }
}

fileprivate class ScanPresentersPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(ScanPresenter.init(withView:router:interactor:))
                .lifetime(.objectGraph)
                .as(check: ScanViewOutput.self, { $0 })
    }
}

fileprivate class ScanRouterPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register1(ScanRouter.init(with:))
                .as(check: ScanRouterInput.self, { $0 })
    }
}

fileprivate class ScanInteractorsPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(ScanInteractor.init(jsonMapper:ticketDao:blackDao:))
                .injection(cycle: true) {
                    $0.output = ($1 as ScanPresenter)
                }
                .lifetime(.objectGraph)
                .as(check: ScanInteractorInput.self, { $0 })
    }
}

