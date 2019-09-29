//
//  HistoryHistoryInteractor.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import RxSwift

class HistoryInteractor: BaseInteractor, HistoryInteractorInput {

    let backgroundSchedule = ConcurrentDispatchQueueScheduler(qos: .background)

    private let ticketsDao: TicketsDao
    private let blkDao: BlockDao
    private let ticketsService: TicketsService

    weak var output: HistoryInteractorOutput?

    init(ticketsDao: TicketsDao, blkDao: BlockDao, ticketsService: TicketsService) {
        self.ticketsDao = ticketsDao
        self.blkDao = blkDao
        self.ticketsService = ticketsService
        super.init()
    }

    func getAllTickets() -> [LMTicket] {
        return [LMTicket]()
    }

    func uploadBlk() {
        let content = blkDao.getAll().map{
            $0.id
            //NMBlock(id: $0.id, comment: $0.comment, idTicket: $0.idTicket)
        }

        let data = UploadBlkData(key: content)

        ticketsService.uploadBlk(content: data)
                .subscribeOn(backgroundSchedule)
                .observeOn(MainScheduler.instance)
                .subscribe(onCompleted: didUploadBlkList, onError: didHandleError)
                .disposed(by: disposeBag)
    }

    func didUploadBlkList() {
        output?.didUploadBlk()
    }

    func didHandleError(e: Error) {
        output?.onError(message: "Что-то пошло не так.")
    }
}


struct UploadBlkData: Codable {
    let key: [String]
}