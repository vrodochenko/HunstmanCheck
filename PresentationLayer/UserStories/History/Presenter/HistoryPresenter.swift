//
//  HistoryHistoryPresenter.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation

class HistoryPresenter: BasePresenter {

    private weak var view: HistoryViewInput!
    private var interactor: HistoryInteractorInput!
    private var router: HistoryRouterInput!

    init(withView view: HistoryViewController, router: HistoryRouterInput, interactor: HistoryInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension HistoryPresenter: HistoryModuleInput {

}

extension HistoryPresenter: HistoryViewOutput {
    func viewIsReady() {

        subscribeOnCreateTickets()

        updateTickets()
    }

    func onTabCloseButton() {
        router.closeCurrentModule()
    }
}

extension HistoryPresenter: HistoryInteractorOutput {
    func onError(message: String) {
        view.showError(withMessage: message)
    }
}

extension HistoryPresenter {
    func didSelectTicket(_ option: HistoryTicketCell.ActionOptions) {
        router.showTicketInfoModule(with: option.item, moduleOutput: self)
    }

    private func subscribeOnCreateTickets() {
        NotificationCenter
                .default
                .addObserver(
                self,
                selector: #selector(didCreateTicket(notification:)),
                name: .createTicket,
                object: nil
        )
    }

    @objc func didCreateTicket(notification: NSNotification) {
        updateTickets()
    }

    private func updateTickets() {
        let tickets = interactor.getAllTickets()

        let actions = [HistoryTicketCell.Action(.click, handler: didSelectTicket)]

        let rows = tickets.map {
            HistoryTicketCell.Builder(item: $0, actions: actions)
        }

        view.showHistory(with: [TableSection(rows: rows)])
    }

}

extension HistoryPresenter: TicketModuleOutput {

}