//
//  BoredActivityTableViewController.swift
//  BoredData
//
//  Created by Nhi Huynh on 4/11/23.
//

import UIKit
import CoreData

class BoredActivityTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var managedContext: NSManagedObjectContext?
    var fetchResultsController: NSFetchedResultsController<BoredActivity>?
    var activityObjects: [BoredActivity] = []
    var delegate: ActivityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activityFetch = NSFetchRequest<BoredActivity>(entityName: "BoredActivity")
        
        activityFetch.sortDescriptors = [ NSSortDescriptor(key: "accessibility", ascending: true) ]
        
        fetchResultsController = NSFetchedResultsController<BoredActivity> (fetchRequest: activityFetch, managedObjectContext: managedContext!, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchResultsController?.delegate = self
        
        do {
            try fetchResultsController?.performFetch()
            activityObjects = fetchResultsController!.fetchedObjects!
            
        } catch {
            print("Error getting activity \(error)")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityObjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activity = activityObjects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell")!
        cell.textLabel?.text = activity.activity
        return cell
    }
    
    // This adds the Delete button
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let activity = activityObjects[indexPath.row]
        
        if editingStyle == .delete {
            
            let title = "Finished \(activity.activity!)?"
            let message = "Are you sure you want to remove this activity?"
            
            // sets up a second confirmation to make sure user is sure they want to delete
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                
                 // Make sure a row is selected
                guard tableView.indexPathForSelectedRow != nil else { return }
                                                
                //Removes data from CoreData
                self.managedContext!.delete(activity)
                
                                                
                do {
                        try self.managedContext!.save()
                        self.loadActivityList()
                        tableView.reloadData()
                    } catch {
                        print("Error deleting, \(error)")
                    }
            })
            ac.addAction(deleteAction)
            // Present the alert controller
            present(ac, animated: true, completion: nil)
            
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        activityObjects = controller.fetchedObjects as! [BoredActivity]
        tableView.reloadData()
    }
    
    func delete(activity: BoredActivity) {
        do {
            managedContext!.delete(activity)
            try managedContext!.save()
        } catch {
            managedContext!.reset()
            print("Error deleting activity, \(error)")
        }
    }
    
    func loadActivityList() {
        let fetchRequest = NSFetchRequest<BoredActivity>(entityName: "BoredActivity")
        
        do {
            activityObjects = try managedContext!.fetch(fetchRequest)
        } catch {
            print("Error fetching data \(error)")
        }
    }
    
}
