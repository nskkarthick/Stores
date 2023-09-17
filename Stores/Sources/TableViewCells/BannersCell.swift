//
//  BannersCell.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import UIKit

class BannersCell: UITableViewCell {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    var bannerModel: HomeData? {
        didSet {
            bannerCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    // Mark: - Custom methods

    private func setupCell() {
        bannerCollectionView.showsHorizontalScrollIndicator = false
        // Layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 0)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 53, height: 181)
        layout.minimumInteritemSpacing = 8
        bannerCollectionView.collectionViewLayout = layout

    }
    
    func updateCategoryTableViewCell(details: HomeData?) {
        bannerCollectionView.registerCell(BannerCollectionViewCell.self)
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        self.bannerModel = details
    }
    
}

// Mark: - UICollectionViewDelegate and UICollectionViewDataSource methods

extension BannersCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerModel?.values.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(BannerCollectionViewCell.self, indexPath) as? BannerCollectionViewCell
        cell?.updateBannerCell(details: bannerModel?.values[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
}
