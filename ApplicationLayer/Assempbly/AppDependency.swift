//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import DITranquillity

class ApplicationDependency {

    static let diContainer: DIContainer = {
        let container = DIContainer()
                .append(framework: AppFramework.self)
                .append(framework: PresentationFramework.self)

        #if DEBUG
        if !container.validate() {
            fatalError("DI validation failed")
        }
        #endif

        return container
    }()
}