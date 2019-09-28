//
//  TicketTicketAssembly.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation
import DITranquillity

class TicketFramework: DIFramework {
    static func load(container: DIContainer) {
        container
                .append(part: TicketRouterPart.self)
                .append(part: TicketInteractorsPart.self)
                .append(part: TicketPresentersPart.self)
                .append(part: TicketViewPart.self)
    }
}

fileprivate class TicketViewPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(TicketViewController.self)
                .injection(cycle: true) {
                    $0.output = $1
                }
                .lifetime(.objectGraph)
    }
}

fileprivate class TicketPresentersPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(TicketPresenter.init(withView:router:interactor:))
                .lifetime(.objectGraph)
                .as(check: TicketViewOutput.self, { $0 })
    }
}

fileprivate class TicketRouterPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register1(TicketRouter.init(with:))
                .as(check: TicketRouterInput.self, { $0 })
    }
}

fileprivate class TicketInteractorsPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register1(TicketInteractor.init(ticketsBaseDao: ))
                .injection(cycle: true) {
                    $0.output = ($1 as TicketPresenter)
                }
                .lifetime(.objectGraph)
                .as(check: TicketInteractorInput.self, { $0 })
    }
}

