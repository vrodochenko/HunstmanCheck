//
//  TicketTicketPresenter.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import ViperMcFlurry.RamblerViperModuleOutput

class TicketPresenter: BasePresenter {

    private weak var view: TicketViewInput!
    private var interactor: TicketInteractorInput!
    private var router: TicketRouterInput!

    var ticket: LMTicket!

    private var moduleOutput: TicketModuleOutput?

    init(withView view: TicketViewController, router: TicketRouterInput, interactor: TicketInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension TicketPresenter: TicketModuleInput {
    public func setModuleOutput(_ moduleOutput: RamblerViperModuleOutput!) {
        self.moduleOutput = moduleOutput as? TicketModuleOutput
    }

    func setTicket(_ ticket: LMTicket) {
        self.ticket = ticket
    }
}

extension TicketPresenter: TicketViewOutput {
    func viewIsReady() {
        view.setTicket(ticket)

        if moduleOutput == nil {
            view.disableActionSection()
        } else {
            view.disableSaveButton()
        }

        if ticket.isSaved || ticket.isBackMark {
            view.disableSaveButton()
        }

        if ticket.isSaved && moduleOutput == nil{
            view.showError(withMessage: "Повторное добавление посетителя.")
        }

        if ticket.isBackMark && moduleOutput == nil{
            view.showError(withMessage: "Пользователь в черном списке")
        }

        if moduleOutput == nil || ticket.isBackMark{
            view.disableActionSection()
        } else {
            view.disableSaveButton()
        }

    }

    func onTabCloseButton() {
        router.closeCurrentModule()
    }

    func didSelectSaveButton() {
        guard ticket.isBackMark == false else {
            view.showError(withMessage: "Посетитель находится в черном списке. Проход запрещен.")
            return
        }

        guard ticket.isSaved == false else {
            view.showError(withMessage: "Повторное посещение")
            return
        }

        interactor.saveTicket(ticket)
        router.closeCurrentModule()
    }

    func didSelectBlockButton() {
        router.showBlockModule(with: ticket, moduleOutput: self)
    }
}

extension TicketPresenter: TicketInteractorOutput {
    func onError(message: String) {
        view.showError(withMessage: message)
    }
}

extension TicketPresenter: BlockModuleOutput {
    func block() {
        view.disableActionSection()
    }
}