//
//  UICollectionView+.swift
//  ReusableKit
//
//  Created by Heorhi Heilik on 29.08.24.
//

import UIKit

public extension UICollectionView {

    func register<Cell: UICollectionViewCell & Reusable>(_ cellType: Cell.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    func register<Cell: UICollectionViewCell & Reusable & NibInstantiatable>(_ cellType: Cell.Type) {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    func dequeueReusableCell<Cell: UICollectionViewCell & Reusable>(
        _ cellType: Cell.Type,
        for indexPath: IndexPath,
        configure: (inout Cell) -> Void
    ) -> UICollectionViewCell {
        guard var cell = dequeueReusableCell(
            withReuseIdentifier: cellType.reuseIdentifier,
            for: indexPath
        ) as? Cell else {
            assertionFailure("Failed to dequeue \(String(describing: Cell.self))")
            return UICollectionViewCell()
        }
        configure(&cell)
        return cell
    }

}
