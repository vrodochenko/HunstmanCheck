//
//  TicketTicketViewController.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit

class TicketViewController: UITableViewController {

    @IBOutlet weak var endToLabel: UILabel!
    @IBOutlet weak var serNumLabel: UILabel!
    @IBOutlet weak var startFromLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    var output: TicketViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    @IBAction func didSelectSaveButton(_ sender: Any) {
        output.didSelectSaveButton()
    }
}

extension TicketViewController: TicketViewInput {

    func setTicket(_ ticket: LMTicket) {
        self.endToLabel.text = ticket.finishOfTour.toString(.RUSSIAN_DATE)
        self.startFromLabel.text = ticket.startOfTour.toString(.RUSSIAN_DATE)
        self.dobLabel.text = ticket.dayOfBirth.toString(.RUSSIAN_DATE)
        self.serNumLabel.text = ticket.serNum
        self.nameLabel.text = ticket.fio
    }

    func showError(withMessage message: String) {
        showAlert(with: message)
    }
}
