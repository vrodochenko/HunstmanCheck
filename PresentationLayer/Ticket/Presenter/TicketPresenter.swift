//
//  TicketTicketPresenter.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

class TicketPresenter: BasePresenter {

    private weak var view: TicketViewInput!
    private var interactor: TicketInteractorInput!
    private var router: TicketRouterInput!

    var ticket: NMTicket!

    init(withView view: TicketViewController, router: TicketRouterInput, interactor: TicketInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension TicketPresenter: TicketModuleInput {
    func setTicket(_ ticket: NMTicket) {
        self.ticket = ticket
    }
}

extension TicketPresenter: TicketViewOutput {
    func viewIsReady() {
        view.setTicket(ticket)
    }

    func onTabCloseButton() {
        router.closeCurrentModule()
    }
}

extension TicketPresenter: TicketInteractorOutput {
    func onError(message: String) {
        view.showError(withMessage: message)
    }
}