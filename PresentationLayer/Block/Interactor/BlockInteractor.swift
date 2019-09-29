//
//  BlockBlockInteractor.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

class BlockInteractor: BaseInteractor, BlockInteractorInput {

    private let blockDao: BlockDao

    weak var output: BlockInteractorOutput?

    init(blockDao: BlockDao) {
        self.blockDao = blockDao
        super.init()
    }

    func addToBlackList(ticket: LMTicket, comment: String) {
        let hash256 = ticket.generateHash()
        let block = LMBlock(id: hash256, idTicket: ticket.id, comment: comment)

        blockDao.add(block: block)
    }
}
