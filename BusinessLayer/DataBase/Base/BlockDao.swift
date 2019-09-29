//
// Created by Арабаджиян Артем on 2019-09-29.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation

protocol BlockDao {

    func add(block: LMBlock)

    func removeAll()

    func getAll() -> [LMBlock]

    func get(byUserHash userHash: String) -> LMBlock?
}
