//
//  BlockBlockPresenter.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import ViperMcFlurry.RamblerViperModuleOutput

class BlockPresenter: BasePresenter {

    private weak var view: BlockViewInput!
    private var interactor: BlockInteractorInput!
    private var router: BlockRouterInput!

    private var ticket: LMTicket!
    private var moduleOutput: BlockModuleOutput?

    init(withView view: BlockViewController, router: BlockRouterInput, interactor: BlockInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension BlockPresenter: BlockModuleInput {
    public func setModuleOutput(_ moduleOutput: RamblerViperModuleOutput!) {
        self.moduleOutput = moduleOutput as? BlockModuleOutput
    }

    func setTicket(_ ticket: LMTicket) {
        self.ticket = ticket
    }
}

extension BlockPresenter: BlockViewOutput {
    func viewIsReady() {
        view.setFio(ticket.fio)
    }

    func didSelectSaveButton(with comment: String?) {
        guard let comment = comment else {
            view.showError(withMessage: "Введите обоснование для блокировки")
            return
        }

        interactor.addToBlackList(ticket: ticket, comment: comment)

        moduleOutput?.block()
        router.closeCurrentModule()
    }

    func onTabCloseButton() {
        router.closeCurrentModule()
    }
}

extension BlockPresenter: BlockInteractorOutput {
    func onError(message: String) {
        view.showError(withMessage: message)
    }
}