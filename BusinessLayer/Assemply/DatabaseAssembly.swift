//
//  DatabaseAssembly.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import DITranquillity

class DataBaseFramework: DIFramework {
    static func load(container: DIContainer) {
        container
                .append(part: CoreDataPart.self)
                .append(part: TicketsPart.self)
    }
}

fileprivate class CoreDataPart: DIPart {
    class func load(container: DIContainer) {
        container
                .register(CoreDataManager.init)
                .lifetime(.single)
                .as(check: CoreDataProtocol.self, { $0 })
    }
}

fileprivate class TicketsPart: DIPart {
    class func load(container: DIContainer) {
        container
                .register1(TicketsDB.init(witContext: ))
                .as(check: TicketsDao.self, { $0 })
    }
}
