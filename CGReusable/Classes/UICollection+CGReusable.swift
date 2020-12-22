//
//  UICollection+CGReusable.swift
//  testsre
//
//  Created by CG on 2020/12/3.
//

import UIKit


// MARK: - 扩展UICollectionView
extension UICollectionView {
    
    /// 纯代码方式 register cell
    /// - Parameter cell: your cell
    func registerReusableCell<T: UICollectionViewCell>(_ cell: T.Type) where T: CGReusable {
        register(cell, forCellWithReuseIdentifier: T.reuseableIdentifier)
    }
    
    /// xib方式 register cell
    /// - Parameter cell: your cell
    func registerReusableCell<T: UICollectionViewCell>(_ cell: T.Type) where T: CGXibReusable {
        register(T.nib, forCellWithReuseIdentifier: T.reuseableIdentifier)
    }
    
    /// dequeueReusableCell
    /// - Parameter indexPath: indexPath
    /// - Returns: cell
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: CGReusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseableIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseableIdentifier)")
        }
        return cell
    }
    
    /// register header or footer
    /// - Parameters:
    ///   - elementKind: UICollectionView.elementKindSectionHeader or UICollectionView.elementKindSectionFooter
    ///   - view: your view
    func registerReusableSupplementaryView<T: UICollectionReusableView>(elementKind: String, _ view: T.Type) where T: CGReusable {
        
        register(view, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseableIdentifier)
        
    }
    
    
    /// xib register header or footer
    /// - Parameters:
    ///   - elementKind: UICollectionView.elementKindSectionHeader or UICollectionView.elementKindSectionFooter
    ///   - view: your view
    func registerReusableSupplementaryView<T: UICollectionReusableView>(elementKind: String, _ view: T.Type) where T: CGXibReusable {
        register(view.nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseableIdentifier)
        
    }
    
    
    /// dequeueReusableSupplementaryView
    /// - Parameters:
    ///   - elementKind: UICollectionView.elementKindSectionHeader or UICollectionView.elementKindSectionFooter
    ///   - indexPath: indexPath
    /// - Returns: your view
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(elementKind: String, indexPath: IndexPath) -> T where T: CGReusable {
        return dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseableIdentifier, for: indexPath) as! T
    }
}
