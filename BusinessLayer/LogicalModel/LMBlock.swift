//
// Created by Арабаджиян Артем on 2019-09-29.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation

class LMBlock: LMBusinessModel {
    let id: String
    let comment: String?
    let idTicket: String

    init(id: String, idTicket: String, comment: String?) {
        self.id = id
        self.comment = comment
        self.idTicket = idTicket
    }
}
