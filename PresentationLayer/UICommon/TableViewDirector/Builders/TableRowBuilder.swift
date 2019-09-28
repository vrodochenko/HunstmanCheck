//
// Created by A on 2019-02-11.
// Copyright (c) 2019 Electronical medicine. All rights reserved.
//

import Foundation
import UIKit

class TableRowBuilder<CellType: ConfigurableCell, DataType>: CellBuilder where CellType.DataType == DataType, CellType: UITableViewCell {
    var reuseId: String {
        return String(describing: CellType.self)
    }

    private var swipeBuilders = [TableRowSwipeBuilder]()
    private lazy var actions = [String: [TableRowAction<CellType, DataType>]]()
    private let item: DataType

    var trailingSwipeActions: [TableRowSwipeBuilder] {
        return swipeBuilders.filter {
            $0.swipeType == .trailing
        }
    }

    var leadingSwipeActions: [TableRowSwipeBuilder] {
        return swipeBuilders.filter {
            $0.swipeType == .leading
        }
    }

    init(item: DataType) {
        self.item = item
    }

    init(item: DataType, actions: [TableRowAction<CellType, DataType>]? = nil, swipeBuilders: [TableRowSwipeBuilder]? = nil) {
        self.item = item

        actions?.forEach {
            on($0)
        }

        if let swipeBuilders = swipeBuilders {
            self.swipeBuilders = swipeBuilders
        }
    }

    @discardableResult
    open func on(_ action: TableRowAction<CellType, DataType>) -> Self {

        if actions[action.type.key] == nil {
            actions[action.type.key] = [TableRowAction<CellType, DataType>]()
        }
        actions[action.type.key]?.append(action)

        return self
    }

    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }

    open func invoke(action: TableRowActionType, cell: UITableViewCell?, path: IndexPath, userInfo: [AnyHashable: Any]? = nil) -> Any? {

        return actions[action.key]?.compactMap({ $0.invokeActionOn(cell: cell, item: item, path: path, userInfo: userInfo) }).last
    }

    open func has(action: TableRowActionType) -> Bool {

        return actions[action.key] != nil
    }

}