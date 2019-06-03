//
//  ConsoleIO.swift
//  CantinaProblem
//
//  Created by Jian Ma on 6/1/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    func promptInstruction() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        writeMessage("\(executableName) instruction:")
        writeMessage("enter attribute to display or q to exit ")
   //     writeMessage("\(executableName)")
    }
}
