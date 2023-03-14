//
//  AddEmployeeVC.swift
//  CoreDataPracticle
//
//  Created by Nayan Pawar on 10/03/23.
//

import UIKit

class AddEmployeeVC: UIViewController {
    
    
     // MARK: IBOutlets
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtBirthdate: UITextField!
    @IBOutlet weak var btnAddEmployee: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddEmployee.layer.cornerRadius = 15

    }
    
 // MARK: To save data in core data on click action of button
    @IBAction func btnAddEmployeeClicked(_ sender: Any) {
        
        let dict = ["firstName":txtFirstName.text,
                    "lastName":txtLastName.text,
                    "email":txtEmail.text,
                    "birthDate":txtBirthdate.text]
        DataBasehelper.shared.save(object: dict as! [String:String])
        
//        self.navigationController?.popViewController(animated: true)
    }
    
}
