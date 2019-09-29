//
// Created by Арабаджиян Артем on 2019-09-29.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation

class BlockDaoAdapter: BaseDaoAdapter<CDMBlock, LMBlock> {
    override func map(from emm: LMBlock, to cdm: CDMBlock) {
        cdm.id = emm.id
        cdm.comment = emm.comment
        cdm.idTicket = emm.idTicket
    }

    override func map(from cdm: CDMBlock) -> LMBlock {
        return LMBlock(id: cdm.id ?? "", idTicket: cdm.idTicket ?? "", comment: cdm.comment ?? "")
    }

    func lm(from nm: NMBlock) -> LMBlock {
        return LMBlock(id: nm.id, idTicket: nm.idTicket, comment: nm.comment)
    }
}
