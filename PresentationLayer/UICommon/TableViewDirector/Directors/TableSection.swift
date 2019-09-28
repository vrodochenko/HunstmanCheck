//
// Created by A on 2019-02-13.
// Copyright (c) 2019 Electronical medicine. All rights reserved.
//

import Foundation

class TableSection {
    var rows: [CellBuilder]

    var title: String?

    var numberOfRows: Int {
        return rows.count
    }

    init(rows: [CellBuilder], title: String? = nil) {
        self.rows = rows
        self.title = title
    }
}