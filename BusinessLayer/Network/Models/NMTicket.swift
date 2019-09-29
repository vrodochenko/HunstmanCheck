//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation

struct NMTicket: Decodable {
    let fio, serNum, id: String
    let finishOfTour, startOfTour, dayOfBirth: Date

    enum CodingKeys: String, CodingKey {
        case id
        case fio = "FIO"
        case dayOfBirth = "Day_of_birth"
        case serNum = "Ser_num"
        case startOfTour = "Start_of_tour"
        case finishOfTour = "Finish_of_tour"
    }
}