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
        // form ...
        // Add Sections with +++
        // Add Rows with <<<
        form
            +++ Section("A")
                <<< TextRow() { row in
                    row.title = "Text Row"
                    row.placeholder = "Enter text here"
                    row.tag = "Sample"
                }
                <<< PhoneRow() {
                    $0.title = "Phone Row"
                    $0.placeholder = "And numbers here"
                }
            +++ Section("B")
                <<< DateRow() {
                    $0.title = "Date Row"
                    $0.value = Date(timeIntervalSinceReferenceDate: 0)
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
        if segue.identifier == "showDataTransferController" {
            let destinationVC = segue.destination as! DataTransferController
            // get text row input value
            let row: TextRow? = form.rowBy(tag: "Sample")
            let value = row?.value
            destinationVC.data = value!
        }
    }
}

