//
//  DataBaseHelper.swift
//  CoreDataPracticle
//
//  Created by Nayan Pawar on 10/03/23.
//

import Foundation
import CoreData
import UIKit

class DataBasehelper{
    
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    static let shared = DataBasehelper()
    
     // MARK: To Save the data in Core Data
    func save(object: [String: String]){
        
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!) as! Employee
        
        employee.firstName = object["firstName"]
        employee.lastName = object["lastName"]
        employee.email = object["email"]
        employee.birthDate = object["birthDate"]
        
        do{
            try context?.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
     // MARK: To fetch the data from Core data to display in Tableview
    func getEmployeeData() -> [Employee]{
        var employee = [Employee]()
        let fetchData = NSFetchRequest<NSManagedObject>(entityName: "Employee")
        do{
            employee = try context?.fetch(fetchData) as! [Employee]
        }catch{
            print(error.localizedDescription)
        }
        return employee
    }
    
    func deleteData(index: Int)-> [Employee]{
        var employee = getEmployeeData()
        context?.delete(employee[index])
        employee.remove(at: index)
        do{
            try context?.save()
        }catch{
            print(error.localizedDescription)
        }
        return employee
    }
}
