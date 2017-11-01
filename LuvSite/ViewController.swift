//
//  ViewController.swift
//  LuvSite
//
//  Created by Ashutosh Singh on 31/08/17.
//  Copyright © 2017 AshutoshSingh. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

   
    @IBOutlet weak var tableView: UITableView!
    var controller: NSFetchedResultsController<Course>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        getFromCoreData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionItem = sections[section]
            return sectionItem.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 451
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellone", for: indexPath) as! CourseCell
        updateCellInfo(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    // Did select row and pass info to new view
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let passedOne = controller.fetchedObjects, passedOne.count > 0 {
            let course = passedOne[indexPath.row]
            performSegue(withIdentifier: "editsegue", sender: course)
            
        }
    }
    
    //prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editsegue" {
            if let guest = segue.destination as? AdditionalVC {
                if let course = sender as? Course {
                    guest.existingCourse = course
                   
                }
            }
        
        }
    }
    
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .insert:
            if let indexPath = newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                
                let cell = tableView.cellForRow(at: indexPath) as! CourseCell
                updateCellInfo(cell: cell, indexPath: indexPath as NSIndexPath)
                
            }
        case .move:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            
            
        }
        
    }
    
    //Update for table View
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    //update cell info
    func updateCellInfo(cell: CourseCell, indexPath: NSIndexPath){
        let course = controller.object(at: indexPath as IndexPath)
        cell.fillCellWithData(course: course)
    }
    
    
    // Fetching the Database here
    
    func getFromCoreData(){
        
        let fetchRequest: NSFetchRequest<Course> = Course.fetchRequest()
        let moneySort = NSSortDescriptor(key: "pets", ascending: true)
        fetchRequest.sortDescriptors = [moneySort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let err = error as NSError
            print("\(err)")
        }
        print("agahjvvxzvk")
        
    }
    
    func testData(){
        let course = Course(context: context)
        
        course.coursename = "Ashutosh Singh"
        course.education = "Bachelor"
        course.professionType = "Developer"
        course.religion = "Hindu"
        course.intent = "Singh Is King"
        course.iam = "Honourable"
        course.intrests = "Reading"
        course.aboutme = "Not yet"
        course.pets = 4
        course.children = "No"
        course.language = "English,hindi"
        course.personality = "Handsome"
        
        
        let course2 = Course(context: context)
        
        course2.coursename = "Ashutosh Singh"
        course2.education = "Bachelor"
        course2.professionType = "Developer"
        course2.religion = "Hindu"
        course2.intent = "Singh Is King"
        course2.iam = "Honourable"
        course2.intrests = "Reading"
        course2.aboutme = "Not yet"
        course2.pets = 4
        course2.children = "No"
        course2.language = "English,hindi"
        course2.personality = "Handsome"
        
        
        let course3 = Course(context: context)
        
        course3.coursename = "Ashutosh Singh"
        course3.education = "Bachelor"
        course3.professionType = "Developer"
        course3.religion = "Hindu"
        course3.intent = "Singh Is King"
        course3.iam = "Honourable"
        course3.intrests = "Reading"
        course3.aboutme = "Not yet"
        course3.pets = 4
        course3.children = "No"
        course3.language = "English,hindi"
        course3.personality = "Handsome"
        
        let course4 = Course(context: context)
        
        course4.coursename = "Ashutosh Singh"
        course4.education = "Bachelor"
        course4.professionType = "Developer"
        course4.religion = "Hindu"
        course4.intent = "Singh Is King"
        course4.iam = "Honourable"
        course4.intrests = "Reading"
        course4.aboutme = "Not yet"
        course4.pets = 4
        course4.children = "No"
        course4.language = "English,hindi"
        course4.personality = "Handsome"

       appdel.saveContext()

    
    }

}

