//
//  CalendarVars.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/5/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import Foundation
let date = Date()
let calendar = Calendar.current

var day = calendar.component(.day, from: date)
var weekday = calendar.component(.weekday, from: date)
let month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)

