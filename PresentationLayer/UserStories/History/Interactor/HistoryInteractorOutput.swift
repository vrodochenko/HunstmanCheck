//
//  HistoryHistoryInteractorOutput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation

protocol HistoryInteractorOutput: class {
    func onError(message: String)

    func didUploadBlk()
}
