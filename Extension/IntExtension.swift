//
//  IntExtension.swift
//  CantinaProblem
//
//  Created by Jian Ma on 6/3/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

extension Int {
    func printTabs(){
        (0..<self).forEach {_ in print("\t", "", separator: "", terminator:"") }
    }
}
