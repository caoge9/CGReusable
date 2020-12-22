//
//  CGNibReusable.swift
//  testsre
//
//  Created by CG on 2020/12/3.
//  使用xib方式注册cell、 header、footer协议

import UIKit

protocol CGNibLoadable {
    static var nib: UINib {get}
}

// Xib 创建的 UITableViewCell 可实现协议
extension CGNibLoadable where Self: UITableViewCell {
    static var nib: UINib {
      return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// Xib 创建的 UICollectionViewCell 可实现协议
extension CGNibLoadable where Self: UICollectionViewCell {
    static var nib: UINib {
      return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}
// Xib 创建的 UICollectionReusableView 可实现协议
extension CGNibLoadable where Self: UICollectionReusableView {
    static var nib: UINib {
      return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}


extension CGNibLoadable where Self : UIView {

    static func loadNibView(className: Self) -> UIView {
        let myclass = type(of: className)
        let bundle = Bundle(for: myclass)
        let name = NSStringFromClass(myclass).components(separatedBy: ".").last
        let nib = UINib(nibName: name!, bundle: bundle)
        return nib.instantiate(withOwner: className, options: nil)[0] as! UIView
    }
    // 可以直接返回想要的自定义View
    static func loadNib(_ nibname : String? = nil) -> Self {
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
 
}
