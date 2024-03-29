//
//  main.swift
//  CantinaProblem
//
//  Created by Jian Ma on 6/1/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//
/*
This project was created to asnwer Cantina's interview coding question.
The challenger was sent on May 29, 2019, 10:20 AM
Write a command line program in a language of your choosing that parses the following JSON file from stdin or from command line argument:

https://github.com/jdolan/quetoo/blob/master/src/cgame/default/ui/settings/SystemViewController.json

Your program may assume that the file resides locally on the same filesystem as the program itself, or it may retrieve it via web request if you prefer.

The JSON file represents a view hierarchy in a user interface. You can think of it as a tree of nodes, just like elements in an HTML DOM. Like in HTML, views have certain attributes that are selectable, ala CSS selectors.

Once parsed, your program should wait for user input on stdin. Each line the user enters on stdin should be treated as a selector, and your program should print the matching views, as JSON, to stdout. The exact format of your output is entirely up to you.

The program must support simple selectors for the following view attributes:

class - The view class name, e.g. "StackView"
classNames - CSS class names, e.g. ".container"
identifier - The view identifier, e.g. "#videoMode"

You can effectively ignore all other attributes in the JSON model for the purpose of selector matching. Note that views have several attributes that may nest child views. For this exercise, you only need to consider subviews, contentView, input and control.

Compound selectors (e.g. "View#identifier") are not required, but you’ll certainly impress us if you support them. Selector chains (e.g. "StackView .container")  are not required, but again, you’ll certainly impress us if you support those, too.

There are 26 views in the given JSON file with the class of Input. Ensure the correctness of your program by asserting that it finds all 26 Inputs given the selector "Input". 
*/
import Foundation

let os = OutputService()
os.ioService()

