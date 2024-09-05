//
//  NibInstantiatable.swift
//  ReusableKit
//
//  Created by Heorhi Heilik on 29.08.24.
//

import UIKit

@MainActor
public protocol NibInstantiatable {
    static var nib: UINib { get }
}

public extension NibInstantiatable {

    static var nib: UINib {
        UINib(nibName: String(describing: Self.self), bundle: nil)
    }

}
