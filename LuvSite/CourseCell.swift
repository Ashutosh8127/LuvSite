//
//  CourseCell.swift
//  LuvSite
//
//  Created by Ashutosh Singh on 31/08/17.
//  Copyright © 2017 AshutoshSingh. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
   
    @IBOutlet weak var courseName: UILabel!
    
    @IBOutlet weak var courseEducation: UILabel!
    
    @IBOutlet weak var courseProfession: UILabel!
    
    @IBOutlet weak var courseReligion: UILabel!
    @IBOutlet weak var courseRelationship: UILabel!
    
    @IBOutlet weak var courseIAm: UILabel!
    @IBOutlet weak var courseIntrests: UILabel!
    @IBOutlet weak var courseAboutMe: UILabel!
    @IBOutlet weak var coursePets: UILabel!
    @IBOutlet weak var courseChildren: UILabel!
    @IBOutlet weak var courseLanguage: UILabel!
    @IBOutlet weak var coursePersonality: UILabel!
    
    func fillCellWithData(course: Course) {

             courseName.text = course.coursename
        courseEducation.text = course.education
       courseProfession.text = course.professionType
         courseReligion.text = course.religion
     courseRelationship.text = course.intent
              courseIAm.text = course.iam
         courseIntrests.text = course.intrests
          courseAboutMe.text = course.aboutme
             coursePets.text = "\(course.pets)"
         courseChildren.text = course.children
         courseLanguage.text = course.language
      coursePersonality.text = course.personality
        
    
        // TODO: Set image later
        
        myImage.image = course.courseToImage?.image as? UIImage
    }
    
}
