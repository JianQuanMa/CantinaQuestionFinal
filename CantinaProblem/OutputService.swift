
//  Created by Jian Ma on 6/1/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
// argument: ${BUILT_PRODUCTS_DIR}/${FULL_PRODUCT_NAME}

import Foundation

class OutputService {
    var root = SubviewContainer(identifier: "", subviews: [])
    var dirString = ""
    
    let consoleIO = ConsoleIO()
    
    
    func getOption(_ selector: String, container: SubviewContainer) {
        
        let myCount = interpretContainer(container: container, selector: selector)
        print("-=- count \(myCount)")
    }
    func ioService() {
        decode()
        consoleIO.promptInstruction()
        var shouldQuit = false
        while !shouldQuit {
            let myInput = consoleIO.getInput()
            if(myInput == "q"){
                shouldQuit = true
            }
            getOption(myInput, container: root)
        }
    }
    var tabCount : Int = 0
    
    func interpretContainer(container: SubviewContainer, selector: String) -> Int {
        var count = 0
        if container.identifier == selector {
            count += 1
            tabCount += 1
            tabCount.printTabs()
            print("-=- selector: \(container.identifier) \(container.subviews.count)")
            tabCount -= 1
        }
        count += getCountAllSubViews(subviews: container.subviews, selector: selector)
        return count
    }
    
    func getCountAllSubViews(subviews: [Subview], selector: String) -> Int {
        var count = 0
        var subViewID = ""
        var rawSelector = selector
        if(selector.isIdentifier()){
            subViewID = "identifier"
            rawSelector.remove(at: rawSelector.startIndex)
        }else if(selector.isClassname()){
            subViewID = "className"
            rawSelector.remove(at: rawSelector.startIndex)
        }
        subviews.forEach { subview in
            tabCount += 1; defer { tabCount -= 1}
            let restriction = subViewID.isEmpty ? true : "\(subview)" == subViewID
            if (subview.class == rawSelector  || subview.classNames.contains(rawSelector) || subview.identifier == rawSelector) && restriction{
                tabCount.printTabs()
                print("-=- selector: \(subview.class) \(subview.classNames) \(subview.identifier)")
                count += 1
            }
            count += getCountAllSubViews(subviews: subview.subviews + (subview.contentView?.subviews ?? []), selector: rawSelector)
        }
        return count
    }
    func decode(){
        let decoder = JSONDecoder()
        do {
            let data = myJson.data(using: .utf8)
            let jsonResult = try decoder.decode(SubviewContainer.self, from: data!)
            root = jsonResult as SubviewContainer
        } catch {
            print(error.localizedDescription)}
    }
}
