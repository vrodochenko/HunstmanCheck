//
// Created by A on 2019-02-11.
// Copyright (c) 2019 Electronical medicine. All rights reserved.
//

import Foundation
import UIKit

class TableViewDirector: NSObject {

    private static let ROW_HEIGHT: CGFloat = 20.0

    private(set) var sections = [TableSection]()
    private(set) weak var tableView: UITableView?

    private var reuseIds = Set<String>()
    private let isNeedCellRegister: Bool

    var headerView: UIView? {
        didSet {
            reloadTable()
        }
    }

    var onScrollVertical: ((Int) -> ())?

    init(withTableView tableView: UITableView, isNeedCellRegister: Bool = false) {
        self.isNeedCellRegister = isNeedCellRegister
        super.init()
        self.tableView = tableView
        self.tableView?.dataSource = self
    }
}

extension TableViewDirector: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count > section ? sections[section].numberOfRows : 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func cellBuilder(forIndexPath indexPath: IndexPath) -> CellBuilder? {
        return indexPath.section < sections.count && indexPath.row < sections[indexPath.section].numberOfRows
                ? sections[indexPath.section].rows[indexPath.row]
                : nil
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let rowBuilder = cellBuilder(forIndexPath: indexPath), rowBuilder.leadingSwipeActions.isEmpty == false else {
            return nil
        }

        let actions = rowBuilder.leadingSwipeActions.map { builder -> UIContextualAction in
            let action = UIContextualAction(style: .normal, title: builder.title, handler: { [weak self] ac, view, success in
                let cell = self?.tableView?.cellForRow(at: indexPath)

                self?.invoke(action: .leadingSwipe, cell: cell, indexPath: indexPath, userInfo: builder.swipeInformation)

                success(true)
            })

            action.image = builder.image
            action.backgroundColor = builder.backgroundColor

            return action
        }

        return UISwipeActionsConfiguration(actions: actions)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let rowBuilder = cellBuilder(forIndexPath: indexPath), rowBuilder.trailingSwipeActions.isEmpty == false else {
            return nil
        }

        let actions = rowBuilder.trailingSwipeActions.map { builder -> UIContextualAction in
            let action = UIContextualAction(style: .normal, title: builder.title, handler: { [weak self] ac, view, success in
                let cell = self?.tableView?.cellForRow(at: indexPath)

                self?.invoke(action: .trailingSwipe, cell: cell, indexPath: indexPath, userInfo: builder.swipeInformation)

                success(true)
            })

            action.image = builder.image
            action.backgroundColor = builder.backgroundColor

            return action
        }

        return actions.isEmpty ? nil : UISwipeActionsConfiguration(actions: actions)
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableViewDirector.ROW_HEIGHT
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let builder = cellBuilder(forIndexPath: indexPath)!

        if isNeedCellRegister && reuseIds.contains(builder.reuseId) == false {
            tableView.register(UINib(nibName: builder.reuseId, bundle: nil), forCellReuseIdentifier: builder.reuseId)
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: builder.reuseId, for: indexPath)

        builder.configure(cell: cell)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)

        if invoke(action: .click, cell: cell, indexPath: indexPath) != nil {
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            invoke(action: .select, cell: cell, indexPath: indexPath)
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        onScrollVertical?(Int(velocity.y))
    }
}

extension TableViewDirector {
    func append(builder: CellBuilder, to section: Int) {
        if sections.count > section {
            sections[section].rows.append(builder)
        }
    }

    func append(section: TableSection) {
        sections.append(section)
    }

    func replace(sections: [TableSection]) {
        self.sections = sections
    }

    func clearSections() {
        sections.removeAll()
    }

    func reloadTable() {
        tableView?.reloadData()
    }
}

extension TableViewDirector {
    @discardableResult
    open func invoke(
            action: TableRowActionType,
            cell: UITableViewCell?,
            indexPath: IndexPath,
            userInfo: [AnyHashable: Any]? = nil) -> Any? {
        guard let row = cellBuilder(forIndexPath: indexPath) else {
            return nil
        }
        return row.invoke(
                action: action,
                cell: cell,
                path: indexPath,
                userInfo: userInfo
        )
    }
}


func +=(left: TableViewDirector, right: TableSection) {
    left.append(section: right)
}