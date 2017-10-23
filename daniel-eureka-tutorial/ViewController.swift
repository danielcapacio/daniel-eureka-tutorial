//
//  ViewController.swift
//  daniel-eureka-tutorial
//
//  Created by Daniel Capacio on 2017-10-22.
//  Copyright © 2017 Daniel Capacio. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sample Form Input"
        // form ...
        // Add Sections with +++
        // Add Rows with <<<
        form
            +++ Section("A")
                <<< TextRow() { row in
                    row.title = "Text Row"
                    row.placeholder = "Enter text here"
                    row.tag = "textRow"
                }
                <<< PhoneRow() {
                    $0.title = "Phone Row"
                    $0.placeholder = "And numbers here"
                    $0.tag = "phoneRow"
                }
            +++ Section("B")
                <<< DateRow() {
                    $0.title = "Date Row"
                    $0.value = Date(timeIntervalSinceReferenceDate: 0)
                    $0.tag = "dateRow"
                }
                <<< ButtonRow("New View") { (row: ButtonRow) -> Void in
                    row.title = row.tag
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
            destinationVC.data = dateToString(date: valuesDictionary["dateRow"] as! Date)
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

