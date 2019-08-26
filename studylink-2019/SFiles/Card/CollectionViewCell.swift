//
//  CollectionViewCell.swift
//  CardTry
//
//  Created by Manprit Heer on 8/18/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

 
    @IBOutlet var mainView: UIView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var firstLbl: UILabel!
    @IBOutlet var lastLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.layer.cornerRadius = 13.0
        self.contentView.layer.shadowColor = UIColor.lightGray.cgColor
        self.contentView.layer.shadowOpacity = 0.5
        self.contentView.layer.shadowOffset = .zero
        self.contentView.layer.shadowPath = UIBezierPath(rect: self.contentView.bounds).cgPath
        self.contentView.layer.shouldRasterize = true
        self.mainView.layer.cornerRadius = 13.0

    }
}
