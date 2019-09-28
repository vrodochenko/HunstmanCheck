//
//  ScanScanPresenter.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

class ScanPresenter: BasePresenter {

    private weak var view: ScanViewInput!
    private var interactor: ScanInteractorInput!
    private var router: ScanRouterInput!

    init(withView view: ScanViewController, router: ScanRouterInput, interactor: ScanInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension ScanPresenter: ScanModuleInput {

}

extension ScanPresenter: ScanViewOutput {
    func viewIsReady() {

    }

    func onTabCloseButton() {
        router.closeCurrentModule()
    }

    func didScanQrCode(with content: String?) {
        interactor.getTicket(from: content)
    }
}

extension ScanPresenter: ScanInteractorOutput {
    func onError(message: String) {
        view.showError(withMessage: message)
    }

    func showTicketInfo(with ticket: LMTicket) {
        router.showTicketModule(with: ticket)
    }
}