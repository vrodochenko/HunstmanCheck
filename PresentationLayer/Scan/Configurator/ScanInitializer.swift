//
//  ScanScanInitializer.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit

class ScanModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var scanViewController: ScanViewController!

    override func awakeFromNib() {

        let configurator = ScanModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: scanViewController)
    }

}
