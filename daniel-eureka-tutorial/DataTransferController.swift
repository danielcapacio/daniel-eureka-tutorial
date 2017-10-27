//
//  DataTransferController.swift
//  daniel-eureka-tutorial
//
//  Created by Daniel Capacio on 2017-10-23.
//  Copyright © 2017 Daniel Capacio. All rights reserved.
//

import UIKit

class DataTransferController: UIViewController {
    
    @IBOutlet weak var label_test: UILabel!
    
    var formData = ["fullName" : "",
                    "dob" : "",
                    "email" : "",
                    "department" : "",
                    "username" : "",
                    "password" : ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.label_test.text = formData["fullName"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
