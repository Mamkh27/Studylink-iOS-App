//
//  RoundButton.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/10/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
