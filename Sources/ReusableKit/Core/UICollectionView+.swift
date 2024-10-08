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

    func register<View: UICollectionReusableView & Reusable>(_ viewType: View.Type, ofKind kind: String) {
        register(viewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: viewType.reuseIdentifier)
    }

    func register<View: UICollectionReusableView & Reusable & NibInstantiatable>(_ viewType: View.Type, ofKind kind: String) {
        register(viewType.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: viewType.reuseIdentifier)
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

    func dequeueReusableSupplementaryView<View: UICollectionReusableView & Reusable>(
        _ viewType: View.Type,
        ofKind kind: String,
        for indexPath: IndexPath,
        configure: (inout View) -> Void
    ) -> UICollectionReusableView {
        guard var view = dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: viewType.reuseIdentifier,
            for: indexPath
        ) as? View else {
            assertionFailure("Failed to dequeue \(String(describing: View.self))")
            return UICollectionReusableView()
        }
        configure(&view)
        return view
    }

}
