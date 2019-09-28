//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import UIKit

class HistoryTicketCell: UITableViewCell, ConfigurableCell {

    typealias CellType = HistoryTicketCell

    typealias Builder = TableRowBuilder<CellType, DataType>
    typealias Action = TableRowAction<CellType, DataType>
    typealias ActionOptions = TableRowActionOptions<CellType, DataType>

    
    @IBOutlet weak var startDateLable: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    func configure(data: LMTicket) {
        self.nameLabel.text = data.fio
        self.startDateLable.text = data.startOfTour.toString(.RUSSIAN_DATE)
    }
}
