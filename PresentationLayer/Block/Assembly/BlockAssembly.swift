//
//  BlockBlockAssembly.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation
import DITranquillity

class BlockFramework: DIFramework {
    static func load(container: DIContainer) {
        container
                .append(part: BlockRouterPart.self)
                .append(part: BlockInteractorsPart.self)
                .append(part: BlockPresentersPart.self)
                .append(part: BlockViewPart.self)
    }
}

fileprivate class BlockViewPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(BlockViewController.self)
                .injection(cycle: true) {
                    $0.output = $1
                }
                .lifetime(.objectGraph)
    }
}

fileprivate class BlockPresentersPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register(BlockPresenter.init(withView:router:interactor:))
                .lifetime(.objectGraph)
                .as(check: BlockViewOutput.self, { $0 })
    }
}

fileprivate class BlockRouterPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register1(BlockRouter.init(with:))
                .as(check: BlockRouterInput.self, { $0 })
    }
}

fileprivate class BlockInteractorsPart: DIPart {
    static func load(container: DIContainer) {
        container
                .register1(BlockInteractor.init(blockDao:))
                .injection(cycle: true) {
                    $0.output = ($1 as BlockPresenter)
                }
                .lifetime(.objectGraph)
                .as(check: BlockInteractorInput.self, { $0 })
    }
}

