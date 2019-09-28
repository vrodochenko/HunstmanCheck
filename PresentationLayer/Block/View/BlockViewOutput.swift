//
//  BlockBlockViewOutput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

protocol BlockViewOutput {

    /**
        @author dibadgo
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func onTabCloseButton()

    func didSelectSaveButton(with comment: String?)

}
