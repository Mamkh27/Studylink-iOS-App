//
//  File.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/14/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

protocol MonthChangeDelegate: AnyObject {
    
     func didChangeMonth( monthIndex: Int,  year: Int)

}
