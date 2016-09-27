//
//  test.swift
//  uhclproject
//
//  Created by Abhishek Kumar on 3/30/16.
//  Copyright © 2016 Abhishek Kumar. All rights reserved.
//

import UIKit

class test: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func drawRect(rect: CGRect) {
       let path = UIBezierPath(ovalInRect: rect)
        UIColor.greenColor().setFill()
        path.fill()
    }
    
    
    
}
