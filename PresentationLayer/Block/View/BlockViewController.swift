//
//  BlockBlockViewController.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit

class BlockViewController: BaseUIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var complaintTextView: UITextView!

    var output: BlockViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    @IBAction func didSelectSaveButton(_ sender: Any) {
        output.didSelectSaveButton(with: complaintTextView.text)
    }
}

extension BlockViewController: BlockViewInput {
    func setFio(_ name: String) {
        nameLabel.text = name
    }

    func showError(withMessage message: String) {
        showAlert(with: message)
    }
}
