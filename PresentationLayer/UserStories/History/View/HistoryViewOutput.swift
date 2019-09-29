//
//  HistoryHistoryViewOutput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

protocol HistoryViewOutput {

    /**
        @author dibadgo
        Notify presenter that view is ready
    */

    func viewIsReady()

    func onTabCloseButton()

    func didSelectUploadButton()
}
