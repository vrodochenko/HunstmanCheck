//
//  TicketTicketViewController.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit

class TicketViewController: UITableViewController {

    private var ACTION_SECTION = Int(1)
    private var BLOCK_ROW = Int(0)

    @IBOutlet weak var endToLabel: UILabel!
    @IBOutlet weak var serNumLabel: UILabel!
    @IBOutlet weak var startFromLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var blackList: UILabel!
    
    var output: TicketViewOutput!
    private var isActiveActionSection = true

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    @IBAction func didSelectSaveButton(_ sender: Any) {
        output.didSelectSaveButton()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == ACTION_SECTION {
            if isActiveActionSection {
                return super.tableView(tableView, numberOfRowsInSection: section)
            } else {
                return 0
            }
        } else {
            return super.tableView(tableView, numberOfRowsInSection: section)
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == ACTION_SECTION && !isActiveActionSection {
            return 0
        } else {
            return super.tableView(tableView, heightForHeaderInSection: section)
        }
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == ACTION_SECTION && !isActiveActionSection {
            return 0
        } else {
            return super.tableView(tableView, heightForFooterInSection: section)
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == ACTION_SECTION && indexPath.row == BLOCK_ROW {
            output.didSelectBlockButton()
        }
    }
}

extension TicketViewController: TicketViewInput {

    func disableActionSection() {
        isActiveActionSection = false
        tableView.reloadData()
    }

    func disableSaveButton() {
        navigationItem.rightBarButtonItem = nil
    }

    func setTicket(_ ticket: LMTicket) {
        self.endToLabel.text = ticket.finishOfTour.toString(.RUSSIAN_DATE)
        self.startFromLabel.text = ticket.startOfTour.toString(.RUSSIAN_DATE)
        self.dobLabel.text = ticket.dayOfBirth.toString(.RUSSIAN_DATE)
        self.serNumLabel.text = ticket.serNum
        self.nameLabel.text = ticket.fio

        if ticket.isBackMark {
            self.blackList.text = "Да"
            self.blackList.textColor = .red
        } else {
            self.blackList.text = "Нет"
        }


    }

    func showError(withMessage message: String) {
        showAlert(with: message)
    }
}
