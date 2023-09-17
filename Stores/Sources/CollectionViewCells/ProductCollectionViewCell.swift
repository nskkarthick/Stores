//
//  ProductCollectionViewCell.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var favImageView: UIImageView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var isExpressImageView: UIImageView!
    @IBOutlet weak var productActualPrice: UILabel!
    @IBOutlet weak var productOfferPriceLabel: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deliveryView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.contentMode = .scaleAspectFit
        baseView.layer.borderWidth = 0.3
        baseView.layer.borderColor = UIColor.gray.cgColor
        baseView.layer.cornerRadius = 2
        addButton.layer.cornerRadius = 4
    }
    
    func updateProductCell(details: Value?) {
        if let offers = details?.offer, offers > 0 {
            discountLabel.text = "\(offers)% OFF"
            discountLabel.isHidden = false
        } else {
            discountLabel.isHidden = true
        }
        productActualPrice.attributedText =  details?.actual_price?.strikeThrough()
        productOfferPriceLabel.text = details?.offer_price
        productName.text = details?.name
        guard let productImageUrl = URL(string: (details?.image!)!) else {
            return
        }
        productImageView.load(url: productImageUrl)
        let isShowingDeliveryOption = details?.is_express ?? false
        deliveryView.isHidden = !isShowingDeliveryOption
    }

}
