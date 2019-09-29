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
