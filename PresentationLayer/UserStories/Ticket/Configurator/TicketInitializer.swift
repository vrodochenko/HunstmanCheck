//
//  TicketTicketInitializer.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit

class TicketModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var ticketViewController: TicketViewController!

    override func awakeFromNib() {

        let configurator = TicketModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: ticketViewController)
    }

}
