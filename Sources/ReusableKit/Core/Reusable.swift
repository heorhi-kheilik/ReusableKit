//
//  Reusable.swift
//  ReusableKit
//
//  Created by Heorhi Heilik on 29.08.24.
//

import UIKit

@MainActor
public protocol Reusable {
    static var reuseIdentifier: String { get }
    var reuseIdentifier: String { get }
}

public extension Reusable {

    static var reuseIdentifier: String {
        String(describing: Self.self)
    }

    var reuseIdentifier: String {
        Self.reuseIdentifier
    }

}

extension UITableViewCell: Reusable { }
extension UICollectionViewCell: Reusable { }
