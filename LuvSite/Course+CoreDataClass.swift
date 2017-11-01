//
//  Course+CoreDataClass.swift
//  LuvSite
//
//  Created by Ashutosh Singh on 31/08/17.
//  Copyright © 2017 AshutoshSingh. All rights reserved.
//

import Foundation
import CoreData

@objc(Course)
public class Course: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.publishedDate = NSDate()
    }


}
