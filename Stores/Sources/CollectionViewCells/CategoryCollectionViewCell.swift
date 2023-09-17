//
//  CategoryCollectionViewCell.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentViewBaseView: UIView!
    @IBOutlet weak var imageBaseView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        imageBaseView.layer.cornerRadius = imageBaseView.frame.height / 2
        imageView.contentMode = .scaleAspectFit
    }
    
    func updateCategoryCell(details: Value?) {
        categoryTitle.text = details?.name
        imageBaseView.backgroundColor = UIColor(red: 53/255.0, green: 155/255.0, blue: 220/255.0, alpha: 0.5)
        guard let imageUrl = URL(string: (details?.image_url!)!) else {
            return
        }
        imageView.load(url: imageUrl)
    }
    

}
