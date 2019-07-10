//
//  curvedView.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/4/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class curvedView: UIView {

    
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func draw(_ rect: CGRect) {
        
        let y:CGFloat = 20
        let curveTo:CGFloat = 0
        
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        myBezier.close()
        let context = UIGraphicsGetCurrentContext()
        (context ?? 0 as! CGContext).setLineWidth(4.0)
        UIColor.white.setFill()
        myBezier.fill()
    }
    
 
    func createRectangle() {
        // Initialize the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addCurve(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height), controlPoint1: CGPoint(x: 2, y: 14), controlPoint2: CGPoint(x: 0, y: 2))
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
    }
    
//in order to use the method, we do it in draw()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
