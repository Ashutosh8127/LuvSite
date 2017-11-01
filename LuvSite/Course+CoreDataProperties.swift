//
//  Course+CoreDataProperties.swift
//  LuvSite
//
//  Created by Ashutosh Singh on 31/08/17.
//  Copyright © 2017 AshutoshSingh. All rights reserved.
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var coursename: String?
    @NSManaged public var aboutme: String?
    @NSManaged public var iam: String?
    @NSManaged public var intent: String?
    @NSManaged public var pets: Double
    @NSManaged public var language: String?
    @NSManaged public var education: String?
    @NSManaged public var children: String?
    @NSManaged public var intrests: String?
    @NSManaged public var religion: String?
    @NSManaged public var professionType: String?
    @NSManaged public var publishedDate: NSDate?
    @NSManaged public var personality: String?
    @NSManaged public var courseToCategory: Category?
    @NSManaged public var courseToImage: Image?

}
