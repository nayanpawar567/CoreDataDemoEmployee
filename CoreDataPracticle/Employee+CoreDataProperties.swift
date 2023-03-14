//
//  Employee+CoreDataProperties.swift
//  CoreDataPracticle
//
//  Created by Nayan Pawar on 10/03/23.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var birthDate: String?

}

extension Employee : Identifiable {

}
