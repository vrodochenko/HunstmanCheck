//
//  LMTicket.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation

class LMTicket: LMBusinessModel {
    let fio, serNum: String
    let finishOfTour, startOfTour, dayOfBirth: Date

    init(fio: String, serNum: String, finishOfTour: Date, startOfTour: Date, dayOfBirth: Date) {
        self.fio = fio
        self.serNum = serNum
        self.finishOfTour = finishOfTour
        self.startOfTour = startOfTour
        self.dayOfBirth = dayOfBirth
    }
}
