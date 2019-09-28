//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import DITranquillity

public class AppFramework: DIFramework {
    public static func load(container: DIContainer) {
        container
//                .append(framework: FetchFramework.self)
                .append(framework: NetworkFramework.self)
                .append(framework: DataBaseFramework.self)
//                .append(framework: RepositoriesFramework.self)
    }
}