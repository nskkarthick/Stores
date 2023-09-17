//
//  ProductsCell.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import UIKit

class ProductsCell: UITableViewCell {

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var productModel: HomeData? {
        didSet {
            productCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    // Mark: - Custom methods
    
    private func setupCell() {
        // Layout
        productCollectionView.showsHorizontalScrollIndicator = false
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 0)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 158, height: 284)
        layout.minimumInteritemSpacing = 2
        productCollectionView.collectionViewLayout = layout
    }
    
    func updateCategoryTableViewCell(details: HomeData?) {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.registerCell(ProductCollectionViewCell.self)
        self.productModel = details
    }
    
}

// Mark: - UICollectionViewDelegate and UICollectionViewDataSource methods

extension ProductsCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productModel?.values.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(ProductCollectionViewCell.self, indexPath) as? ProductCollectionViewCell
        cell?.updateProductCell(details: productModel?.values[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
}
