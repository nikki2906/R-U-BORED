//
//  ViewController.swift
//  BoredData
//
//  Created by Nhi Huynh on 4/11/23.
//

import UIKit
import CoreData

class BoredActivityViewController: UIViewController, ActivityDelegate {
    
    let activityFetcher = ActivityService()
    var managedContext: NSManagedObjectContext?
   
    
    @IBOutlet var activityTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                  fatalError("Unable to access AppDelegate")
              }
              managedContext = appDelegate.persistentContainer.viewContext
              
              activityFetcher.activityDelegate = self
              activityFetcher.fetchRandomActivity(context: managedContext!)
            }
    @IBAction func newActivityTapped(_ sender: Any) {
        activityFetcher.fetchRandomActivity(context: managedContext!)
    }
    
    func activityFetched(activity: BoredActivity) {
        DispatchQueue.main.async {
            let activityText = "\(activity.activity!)"
            self.activityTextView.text = activityText
        }
    }
    
    func activityFetchError(because activityError: ActivityError) {
        let alert = UIAlertController(title: "Error", message: "Error getting activity. \(activityError.message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func activityListTapped(_ sender: Any) {
        
    }
    
    @IBAction func saveActivity(_ sender: Any) {
        
        do { try managedContext!.save() }
        catch { print("Error saving") }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveActivity" || segue.identifier == "activityList" {
            let tableViewController = segue.destination as! BoredActivityTableViewController
            tableViewController.managedContext = managedContext
        }
        
    }
    
    
    

    


}

