//
//  BannerCollectionViewCell.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerImageView.contentMode = .scaleToFill
    }
    
    func updateBannerCell(details: Value?) {
        guard let bannerImageUrl = URL(string: (details?.banner_url!)!) else {
            return
        }
        bannerImageView.load(url: bannerImageUrl)
    }

}
