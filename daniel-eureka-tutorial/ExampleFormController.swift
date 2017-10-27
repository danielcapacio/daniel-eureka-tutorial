//
//  ExampleFormController.swift
//  daniel-eureka-tutorial
//
//  Created by Daniel Capacio on 2017-10-26.
//  Copyright © 2017 Daniel Capacio. All rights reserved.
//

import UIKit
import Eureka

class ExampleFormController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Example Form"
        
        TextRow.defaultCellUpdate = { cell, row in
            if !row.isValid {
                cell.titleLabel?.textColor = .red
            }
        }
        
        form
            +++ Section("Personal Information")
                <<< TextRow() {
                    $0.tag = "fullName"
                    $0.title = "Full Name"
                    $0.add(rule: RuleRequired())
                    $0.validationOptions = .validatesOnDemand
                }
                <<< DateRow() {
                    $0.tag = "dob"
                    $0.title = "Date of Birth"
                    $0.value = Date();
                }
                <<< TextRow() {
                    $0.tag = "email"
                    $0.title = "Primary Email"
                    $0.add(rule: RuleRequired())
                    $0.add(rule: RuleEmail())
                    $0.validationOptions = .validatesOnDemand
                }
                <<< ActionSheetRow<String>() {
                    $0.tag = "department"
                    $0.title = "Department"
                    $0.selectorTitle = "Choose preferred department"
                    $0.options = ["Mathematics", "Social Studies", "Literature", "Science"]
                    $0.value = "Literature"
                    } .onPresent { from, to in
                        to.popoverPresentationController?.permittedArrowDirections = .up
                }
            
            +++ Section("Login Information")
                <<< TextRow() {
                    $0.tag = "username"
                    $0.title = "Username"
                    $0.add(rule: RuleRequired())
                    $0.validationOptions = .validatesOnDemand
                }
                <<< PasswordRow() {
                    $0.tag = "password"
                    $0.title = "Password"
                    $0.add(rule: RuleMinLength(minLength: 8))
                    $0.add(rule: RuleMaxLength(maxLength: 13))
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }
                }
            +++ Section(header: "Invalid fields in red", footer: "")
                <<< ButtonRow() {
                        $0.tag = "validate"
                        $0.title = "Validate"
                }.onCellSelection { cell, row in
                    row.section?.form?.validate()
                }
            +++ Section()
                <<< ButtonRow() { (row: ButtonRow) -> Void in
                    row.tag = "submit"
                    row.title = "Submit"
                    row.presentationMode = .segueName(segueName: "showDataTransferController", onDismiss: nil)
                }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the value of all rows which have a Tag assigned
        // The dictionary contains the 'rowTag':value pairs.
        let valuesDictionary = form.values()
        
        // pass and assign values here
        if segue.identifier == "showDataTransferController" {
            let destinationVC = segue.destination as! DataTransferController
            destinationVC.formData["fullName"] = valuesDictionary["fullName"] as? String
            destinationVC.formData["dob"] = self.dateToString(date: valuesDictionary["dob"] as! Date)
            destinationVC.formData["email"] = valuesDictionary["email"] as? String
            destinationVC.formData["department"] = valuesDictionary["department"] as? String
            destinationVC.formData["username"] = valuesDictionary["username"] as? String
            destinationVC.formData["password"] = valuesDictionary["password"] as? String
        }
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy"
        
        return formatter.string(from: yourDate!)
    }
}
