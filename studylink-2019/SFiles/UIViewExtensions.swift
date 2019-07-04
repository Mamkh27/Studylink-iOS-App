//
//  UIViewExtensions.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/2/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

//CODER'S NOTE
//tried creating a fadeIn function template
//for some reason it won't work with my code and
// the image doesn't fade in like it's supposed to
// --> WelcomeViewController.swift


import Foundation
import UIKit

extension UIView{
    func fadeIn(duration: TimeInterval, delay: TimeInterval, completion:((_ finished:Bool)-> Void)?){
        //Fade In
        UIView.animate( withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
}
