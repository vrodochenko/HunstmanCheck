//
//  HistoryHistoryViewController.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit

class HistoryViewController: BaseUIViewController {

    @IBOutlet weak var historyTableView: UITableView!

    @IBOutlet weak var lodingView: CUIXLoading!

    private var tableDirector: TableViewDirector!
    var output: HistoryViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareTableView()

        output.viewIsReady()
    }
    
    @IBAction func uploadButton(_ sender: Any) {
        output.didSelectUploadButton()
    }
}

extension HistoryViewController: HistoryViewInput {
    func showSuccess(message: String) {
        showAlert(with: message, title: "Отлично!")
    }

    func showLoading() {
        lodingView.startLoading(with: "Выгрузка данных...")
        lodingView.isHidden = false
        historyTableView.isHidden = true
    }

    func hideLoading() {
        lodingView.stopLoading()
        lodingView.isHidden = true
        historyTableView.isHidden = false
    }

    func showHistory(with sections: [TableSection]) {
        tableDirector.replace(sections: sections)
        tableDirector.reloadTable()
    }

    func showError(withMessage message: String) {
        showAlert(with: message)
    }
}

extension HistoryViewController {
    private func prepareTableView() {
        tableDirector = TableViewDirector(withTableView: historyTableView)
        historyTableView.delegate = tableDirector
    }
}
