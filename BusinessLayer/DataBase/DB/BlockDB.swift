//
// Created by Арабаджиян Артем on 2019-09-29.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation

class BlockDB: BaseDB<CDMBlock, LMBlock>, BlockDao {

    init(witContext context: CoreDataProtocol) {
        super.init(witContext: context, adapter: BlockDaoAdapter())
    }

    func add(block: LMBlock) {
        super.insertAll(items: [block])
    }
}
