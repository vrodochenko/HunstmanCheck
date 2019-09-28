//
//  BlockBlockInitializer.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit

class BlockModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var blockViewController: BlockViewController!

    override func awakeFromNib() {

        let configurator = BlockModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: blockViewController)
    }

}
