//
//  DataTransferController.swift
//  daniel-eureka-tutorial
//
//  Created by Daniel Capacio on 2017-10-23.
//  Copyright © 2017 Daniel Capacio. All rights reserved.
//

import UIKit
import Eureka

class DataTransferController: FormViewController {
    
    var formData = ["fullName" : "",
                    "dob" : "",
                    "email" : "",
                    "department" : "",
                    "username" : "",
                    "password" : ""]
    
    override func viewDidLoad() {
        self.title = "Form data"
        super.viewDidLoad()
        form
            +++ Section()
                <<< LabelRow() { $0.title = "Full Name"; $0.value = formData["fullName"]; }
                <<< LabelRow() { $0.title = "Date of Birth"; $0.value = formData["dob"] }
                <<< LabelRow() { $0.title = "Primary Email"; $0.value = formData["email"] }
                <<< LabelRow() { $0.title = "Department"; $0.value = formData["department"] }
                <<< LabelRow() { $0.title = "Username"; $0.value = formData["username"] }
                <<< LabelRow() { $0.title = "Password"; $0.value = formData["password"] }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
