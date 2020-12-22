//
//  CGReusable.swift
//  testsre
//
//  Created by CG on 2020/12/3.
//  纯代码cell, header、 footer协议

import Foundation
import UIKit

// 纯代码cell, header、 footer协议
protocol CGReusable {
    static var reuseableIdentifier: String {get}
}

// 使用纯代码方式创建的 UITableViewCell 可实现协议
extension CGReusable where Self: UITableViewCell {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }
}

// 扩展协议复用UITableViewHeaderFooterView
extension CGReusable where Self: UITableViewHeaderFooterView {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }
}

// 使用纯代码方式创建的 UICollectionViewCell 可实现协议
extension CGReusable where Self: UICollectionViewCell {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }
}

// 使用纯代码方式创建的 UICollectionReusableView 可实现协议
extension CGReusable where Self: UICollectionReusableView {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }
}

// xib方式创建 cell 实现 CGXibReusable 协议
typealias CGXibReusable = CGReusable & CGNibLoadable
