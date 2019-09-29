//
//  HistoryHistoryViewInput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

protocol HistoryViewInput: class {

    /**
        @author dibadgo
        Show error
    */
    func showError(withMessage message: String)

    func showHistory(with rows: [TableSection])

    func showLoading()

    func hideLoading()

    func showSuccess(message: String)
}
