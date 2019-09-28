//
//  HistoryHistoryInitializer.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit

class HistoryModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var historyViewController: HistoryViewController!

    override func awakeFromNib() {

        let configurator = HistoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: historyViewController)
    }

}
