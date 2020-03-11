//
//  Book+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Quynh on 3/6/20.
//  Copyright © 2020 Quynh. All rights reserved.
//
//

import Foundation
import CoreData

extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var bookId: Int16
    @NSManaged public var bookName: String?
    @NSManaged public var author: String?
    @NSManaged public var category: String?
    @NSManaged public var owner: User?

}
