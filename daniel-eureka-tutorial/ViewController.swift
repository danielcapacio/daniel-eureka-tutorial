//
//  ViewController.swift
//  daniel-eureka-tutorial
//
//  Created by Daniel Capacio on 2017-10-22.
//  Copyright © 2017 Daniel Capacio. All rights reserved.
//

import UIKit
import Eureka
import ImageRow

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // border styling for ImageRow
        ImageRow.defaultCellUpdate = { cell, row in
            cell.accessoryView?.layer.cornerRadius = 17
            cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        }
        // set default text color to be blue for URLRow
        URLRow.defaultCellUpdate = { cell, row in
            cell.textField.textColor = .blue
        }
        
        self.title = "Sample Field Rows"
        // form ...
        // Add Sections with +++
        // Add Rows with <<<
        form
            +++ Section("A")
                <<< URLRow() {
                    $0.title = "URLRow"
                    $0.value = URL(string: "https://")
                }
                <<< PhoneRow() {
                    $0.title = "PhoneRow"
                    $0.value = "123-456-7890"
                }
                <<< NameRow() {
                    $0.title =  "NameRow"
                    $0.placeholder = "Enter name here"
                }
                <<< PasswordRow() {
                    $0.title = "PasswordRow"
                    $0.value = "password"
                }
                <<< IntRow() {
                    $0.title = "IntRow"
                    $0.value = 1408
                }
                <<< EmailRow() {
                    $0.title = "EmailRow"
                    $0.value = "a@a.com"
                }
                <<< TwitterRow() {
                    $0.title = "TwitterRow"
                    $0.value = "@caseyneistat"
                }
                <<< AccountRow() {
                    $0.title = "AccountRow"
                    $0.placeholder = "Placeholder"
                }
                <<< ZipCodeRow() {
                    $0.title = "ZipCodeRow"
                    $0.placeholder = "V5L 1X6"
                }
            +++ Section("B")
                <<< DateRow() {
                    $0.title = "DateRow"
                    $0.value = Date();
                }
                <<< CheckRow() {
                    $0.title = "CheckRow"
                    $0.value = true
                }
                <<< SwitchRow() {
                    $0.title = "SwitchRow"
                    $0.value = true
                }
                <<< SliderRow() {
                    $0.title = "SliderRow"
                    $0.minimumValue = 0.0
                    $0.maximumValue = 100.0
                    $0.value = 60.0
                }
                <<< StepperRow() {
                    $0.title = "StepperRow"
                    $0.value = 1.0
                }
            +++ Section("Selector Row Examples")
                <<< ActionSheetRow<String>() {
                    $0.title = "ActionSheetRow"
                    $0.selectorTitle = "Favourite genre?"
                    $0.options = ["Adventure", "Horror", "Comedy", "Mystery"]
                    $0.value = "Adventure"
                } .onPresent { from, to in
                    to.popoverPresentationController?.permittedArrowDirections = .up
                }
                <<< AlertRow<Emoji>() {
                    $0.title = "AlertRow"
                    $0.selectorTitle = "How are you feeling?"
                    $0.options = [😃, 🙁, 😭, 😐, 😎, 😱, 😠, 😗]
                    $0.value = 😎
                }.onPresent { _, to in
                    to.view.tintColor = .red
                }
                <<< PushRow<Emoji>() {
                    $0.title = "PushRow"
                    $0.options = [😃, 🙁, 😭, 😐, 😎, 😱, 😠, 😗]
                    $0.value = 😱
                    $0.selectorTitle = "Choose an Emoji!"
                }.onPresent { from, to in
                    to.dismissOnSelection = false
                    to.dismissOnChange = false
                }
                <<< ImageRow() {
                    $0.title = "ImageRow"
                }
            +++ Section()
                <<< ButtonRow() { (row: ButtonRow) -> Void in
                    row.title = "Submit"
                    row.presentationMode = .segueName(segueName: "showExampleFormController", onDismiss: nil)
                }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExampleFormController" {
            _ = segue.destination as! ExampleFormController
        }
    }
}

typealias Emoji = String
let 😃 = "😃", 🙁 = "🙁", 😭 = "😭", 😐 = "😐", 😎 = "😎", 😱 = "😱", 😠 = "😠", 😗 = "😗"

