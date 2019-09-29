//
//  HistoryHistoryAssembly.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation
import DITranquillity

class HistoryFramework: DIFramework {
    static func load(container: DIContainer) {
        container
                .append(part: HistoryRouterPart.self)
                .append(part: HistoryInteractorsPart.self)
                .append(part: HistoryPresentersPart.self)
                .append(part: HistoryViewPart.self)
    }
}

fileprivate class HistoryViewPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(HistoryViewController.self)
                .injection(cycle: true) {
                    $0.output = $1
                }
                .lifetime(.objectGraph)
    }
}

fileprivate class HistoryPresentersPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(HistoryPresenter.init(withView:router:interactor:))
                .lifetime(.objectGraph)
                .as(check: HistoryViewOutput.self, { $0 })
    }
}

fileprivate class HistoryRouterPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register1(HistoryRouter.init(with:))
                .as(check: HistoryRouterInput.self, { $0 })
    }
}

fileprivate class HistoryInteractorsPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(HistoryInteractor.init(ticketsDao:blkDao:ticketsService:))
                .injection(cycle: true) {
                    $0.output = ($1 as HistoryPresenter)
                }
                .lifetime(.objectGraph)
                .as(check: HistoryInteractorInput.self, { $0 })
    }
}

