//
//  UITableView+CGReusable.swift
//  testsre
//
//  Created by CG on 2020/12/3.
//

import UIKit

// MARK: - 扩展UITableView
extension UITableView {
    
    /// 注册纯代码cell
    /// - Parameter cell: 传入自定义cell
    func registerCell<T: UITableViewCell >(_ cell: T.Type) where T : CGReusable {
        register(cell, forCellReuseIdentifier: T.reuseableIdentifier)
    }
    
    /// 注册xib cell
    /// - Parameter cell: custome xib cell
    func registerCell<T: UITableViewCell >(_ cell: T.Type) where T : CGReusable & CGNibLoadable {
        register(T.nib, forCellReuseIdentifier: T.reuseableIdentifier)
    }
    
    /// 重用cell
    /// - Parameter indexPath: IndexPath
    /// - Returns: cell
    func dequeReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: CGReusable{
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseableIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseableIdentifier)")
        }
        return cell
    }
    
    
    /// code方式注册header 或 footer
    /// - Parameter view: your view
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ view: T.Type) where T: CGReusable {
        register(view, forHeaderFooterViewReuseIdentifier: T.reuseableIdentifier)
    }
    
    
    /// xib方式注册header或footer
    /// - Parameter view: you view
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ view: T.Type) where T: CGReusable & CGNibLoadable {
        register(view.nib, forHeaderFooterViewReuseIdentifier: T.reuseableIdentifier)
    }
    
    
    /// 重用header 或 footer
    /// - Returns: your view
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: CGReusable {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseableIdentifier) as! T?
    }
}
