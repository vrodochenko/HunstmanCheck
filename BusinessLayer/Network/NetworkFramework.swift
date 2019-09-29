//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import DITranquillity

class NetworkFramework: DIFramework {
    class func load(container: DIContainer) {
        container
                .append(part: MapperPart.self)
                .append(part: TicketsServicePart.self)
    }
}

fileprivate class MapperPart: DIPart {
    class func load(container: DIContainer) {
        container
                .register(JsonMapper.init)
                .lifetime(.single)
                .as(check: JsonMapperProtocol.self, { $0 })
    }
}

fileprivate class TicketsServicePart: DIPart {
    class func load(container: DIContainer) {
        container
                .register1(TicketsService.init(withParser:))
                .lifetime(.single)
                .as(check: TicketsApi.self, { $0 })
    }
}
