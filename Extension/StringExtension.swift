//
//  StringExtension.swift
//  CantinaProblem
//
//  Created by Jian Ma on 6/1/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

extension String {
    func isClassname() -> Bool {
        return self.prefix(1) == "."
    }
    func isIdentifier() -> Bool {
        return self.prefix(1) == "#"
    }
    func isContainClassName() -> Bool {
        return self.contains(".")
    }
    func isContainIdentifier() -> Bool {
        return self.contains("#")
    }
}
