//
//  ScanScanInteractor.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

class ScanInteractor: BaseInteractor, ScanInteractorInput {

    private let jsonMapper: JsonMapperProtocol

    weak var output: ScanInteractorOutput?

    init(jsonMapper: JsonMapperProtocol) {
        self.jsonMapper = jsonMapper
        super.init()
    }

    func getTicket(from qrContent: String?) {

        guard let qrContent = qrContent else {
            output?.onError(message: "Не могу распознать QR код") //TODO strings
            return
        }

        guard let ticketData = qrContent.data(using: .utf8) else {
            output?.onError(message: "Не могу распознать QR код") //TODO strings
            return
        }

        guard let ticket = jsonMapper.map(NMTicket.self, from: ticketData) else {
            output?.onError(message: "Не могу распознать QR код") //TODO strings
            return
        }

        let logicModel = TicketsAdapter().lm(from: ticket)

        output?.showTicketInfo(with: logicModel)
    }
}
