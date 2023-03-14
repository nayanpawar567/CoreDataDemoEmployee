//
//  ViewController.swift
//  CoreDataPracticle
//
//  Created by Nayan Pawar on 10/03/23.
//

import UIKit

class ViewController: UIViewController {

     // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
     // MARK: Variables
    var employee = [Employee]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        employee = DataBasehelper.shared.getEmployeeData()
        tableView.reloadData()
    }
    
     // MARK: SetupTableView
    func setUpUI(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // To Navigate to AddEmployee Vc
    @IBAction func btnAddClicked(_ sender: Any) {
        
        guard let secVC = storyboard?.instantiateViewController(withIdentifier: "AddEmployee") as? AddEmployeeVC else {fatalError()}

        self.navigationController?.pushViewController(secVC, animated: true)
    }
   
}



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
     // MARK: set number of rows in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    
     // MARK: To display the data in tableview cell which is getting saved
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EmployeeListCell else{fatalError()}
        
        if let firstName = employee[indexPath.row].firstName, let lastName = employee[indexPath.row].lastName {
            cell.lblname.text = "\(firstName) \(lastName)"
        }
        cell.lblEmail.text = employee[indexPath.row].email
        cell.lblBirthdate.text = employee[indexPath.row].birthDate
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     // MARK: To delet data from cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            employee = DataBasehelper.shared.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

