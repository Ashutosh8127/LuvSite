//
//  AdditionalVC.swift
//  LuvSite
//
//  Created by Ashutosh Singh on 31/08/17.
//  Copyright © 2017 AshutoshSingh. All rights reserved.
//

import UIKit
import CoreData

class AdditionalVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    var category = [Category]()
    
    //property - didselectRow
    var existingCourse: Course?
    
    
    
    
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var aboutMe: UITextField!
    @IBOutlet weak var iAma: UITextField!
    @IBOutlet weak var myIntent: UITextField!
    @IBOutlet weak var relationshipStatus: UITextField!
    @IBOutlet weak var myReligion: UITextField!
    
    @IBOutlet weak var professionType: UITextField!
    @IBOutlet weak var myEducation: UITextField!
    @IBOutlet weak var myPets: UITextField!
    @IBOutlet weak var myPersonality: UITextField!
    @IBOutlet weak var myLanguage: UITextField!
    @IBOutlet weak var myChildren: UITextField!
    @IBOutlet weak var myIntrests: UITextField!
    
    
    //imagePicker declared
    var imagePicker: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
        
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        //getTestDataPi()
        
        getCateData()
        
        if existingCourse != nil {
            loadCourseInfo()
        }

        
    }

    @IBAction func pickImageTapped(_ sender: Any)
    {
         present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let ima = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImage.image = ima
        }
        
        //classic thing to forget easily
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
   
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        var course: Course!
        
        let pic = Image(context: context)
        pic.image = myImage.image
        
        if existingCourse == nil {
            course = Course(context: context)
        } else {
            course = existingCourse
        }
        
        
        course.courseToImage = pic
        
        
        if let courseName = aboutMe.text {
            course.coursename = courseName
        }
        
        if let sureEducation = myEducation.text {
            course.education = sureEducation
        }
        
        
        if let courseIam = iAma.text {
            course.iam = courseIam
        }
        
        if let sureProfessiontype = professionType.text {
            course.professionType = sureProfessiontype
        }
        
        
        if let courseReligion = myReligion.text {
            course.religion = courseReligion
        }
        
        if let sureIntent = myIntent.text {
            course.intent = sureIntent
        }
        
        if let courseIntrests = myIntrests.text {
            course.intrests = courseIntrests
        }
        
        if let sureChildren = myChildren.text {
            course.children = sureChildren
        }
        
        
        if let courseLanguage = myLanguage.text {
            course.language = courseLanguage
        }
        
        if let sureEducation = myPersonality.text {
            course.personality = sureEducation
        }
        
        if let courseAboutme = relationshipStatus.text {
            course.aboutme = courseAboutme
        }
        
        if let surePets = myPets.text {
            course.pets = (surePets as NSString).doubleValue
        }
        
       // course.courseToCategory = category[categoryPicker.selectedRow(inComponent: 0)]
        
        appdel.saveContext()
        
        //go tback to main screen
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        if existingCourse != nil {
            context.delete(existingCourse!)
            appdel.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let category = self.category[row]
        return category.image
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
    
    
    //Fetch category data from core data
    
    func getCateData(){
        
        let fetchMe: NSFetchRequest<Category> = Category.fetchRequest()
        
        do{
            self.category = try context.fetch(fetchMe)
            self.categoryPicker.reloadAllComponents()
        } catch {
            //handle the error
        }
        
        
    }
    
    
    //Load course info  from Main screen
    
    func loadCourseInfo(){
        if let course = existingCourse {
           
            aboutMe.text = course.coursename
            myEducation.text =   course.education
            iAma.text = course.iam
            professionType.text = course.professionType
            myReligion.text = course.religion
            myIntent.text = course.intent
            myIntrests.text = course.intrests
            myChildren.text =  course.children
            myLanguage.text = course.language
            myPersonality.text = course.personality
            relationshipStatus.text = course.aboutme
            myPets.text = "\(course.pets)"
            myImage.image = course.courseToImage?.image as? UIImage
        }
    }
    
    
    func getTestDataPi(){
        let category = Category(context: context)
        category.image = "WebDev"
        
        let category1 = Category(context: context)
        category1.image = "iOS 11"
        
        let category2 = Category(context: context)
        category2.image = "InfoSec"
        
        let category3 = Category(context: context)
        category3.image = "Android"
        
        let category4 = Category(context: context)
        category4.image = "python"
        
        appdel.saveContext()
        
        
        
    }
    
    

}
