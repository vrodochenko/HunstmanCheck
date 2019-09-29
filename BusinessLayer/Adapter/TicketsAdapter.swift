//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation

class TicketsAdapter: BaseDaoAdapter<CDMTicket, LMTicket> {
    override func map(from emm: LMTicket, to cdm: CDMTicket) {
        cdm.dob = emm.dayOfBirth as NSDate
        cdm.finishTrip = emm.finishOfTour as NSDate
        cdm.startTrip = emm.startOfTour as NSDate
        cdm.fio = emm.fio
        cdm.passpotData = emm.serNum
        cdm.id = emm.id
    }

    override func map(from cdm: CDMTicket) -> LMTicket {
        return LMTicket(
                id: cdm.id,
                fio: cdm.fio,
                serNum: cdm.passpotData,
                finishOfTour: cdm.finishTrip as Date,
                startOfTour: cdm.startTrip as Date,
                dayOfBirth: cdm.dob as Date
        )
    }

    func lm(from nm: NMTicket) -> LMTicket {
        return LMTicket(
                id: nm.id,
                fio: nm.fio,
                serNum: nm.serNum,
                finishOfTour: nm.finishOfTour,
                startOfTour: nm.startOfTour,
                dayOfBirth: nm.dayOfBirth
        )
    }
}