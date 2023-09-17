//
//  Extension.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let cellReuseIdentifier = String(describing: cellClass)
        let nib = UINib(nibName: cellReuseIdentifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    func dequeueCell<T: UITableViewCell>(_ cellClass: T.Type, _ indexPath: IndexPath) -> UITableViewCell {
        self.dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath)
    }
    
}

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_ cellClass: T.Type) {
        let cellReuseIdentifier = String(describing: cellClass)
        let nib = UINib(nibName: cellReuseIdentifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    func dequeueCell<T: UICollectionViewCell>(_ cellClass: T.Type, _ indexPath: IndexPath) -> UICollectionViewCell {
        self.dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath)
    }
}

enum APIRoot: String {
    case MenuList = "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
