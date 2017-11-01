//
//  Category+CoreDataProperties.swift
//  LuvSite
//
//  Created by Ashutosh Singh on 31/08/17.
//  Copyright © 2017 AshutoshSingh. All rights reserved.
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var image: String?
    @NSManaged public var categoryToCourse: Course?
    @NSManaged public var categoryToImage: Image?

}
