//
//  CategoriesCell.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import UIKit

class CategoriesCell: UITableViewCell {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryModel: HomeData? {
        didSet {
            categoryCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Mark: - Custom methods
    
    private func setupCell() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        // Register cell
        categoryCollectionView.registerCell(CategoryCollectionViewCell.self)
        categoryCollectionView.showsHorizontalScrollIndicator = false
        // Layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 0)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 100)
        layout.minimumInteritemSpacing = 20
        categoryCollectionView.collectionViewLayout = layout
    }
    
    func updateCategoryTableViewCell(details: HomeData?) {
        self.categoryModel = details
    }
    
}

// Mark: - UICollectionViewDelegate and UICollectionViewDataSource methods

extension CategoriesCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryModel?.values.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(CategoryCollectionViewCell.self, indexPath) as? CategoryCollectionViewCell
        cell?.updateCategoryCell(details: categoryModel?.values[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
}
