//
//  User+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Quynh on 3/6/20.
//  Copyright © 2020 Quynh. All rights reserved.
//
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var yearOfBirth: String?
    @NSManaged public var address: String?
    @NSManaged public var books: NSSet?

}

// MARK: Generated accessors for books
extension User {

    @objc(addBooksObject:)
    @NSManaged public func addToBooks(_ value: Book)

    @objc(removeBooksObject:)
    @NSManaged public func removeFromBooks(_ value: Book)

    @objc(addBooks:)
    @NSManaged public func addToBooks(_ values: NSSet)

    @objc(removeBooks:)
    @NSManaged public func removeFromBooks(_ values: NSSet)

}
