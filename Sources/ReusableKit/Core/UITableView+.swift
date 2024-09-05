//
//  UITableView+.swift
//  ReusableKit
//
//  Created by Heorhi Heilik on 29.08.24.
//

import UIKit

public extension UITableView {

    func register<Cell: UITableViewCell & Reusable>(_ cellType: Cell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    func register<Cell: UITableViewCell & Reusable & NibInstantiatable>(_ cellType: Cell.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    func dequeueReusableCell<Cell: UITableViewCell & Reusable>(
        _ cellType: Cell.Type,
        for indexPath: IndexPath
    ) -> Cell? {
        dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? Cell
    }

}
