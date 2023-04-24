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
        //performSegue(withIdentifier: "activityList", sender: sender)
        
    }
    
    @IBAction func saveActivity(_ sender: Any) {
    
        // This should save an Activity to CoreData
        // use the managedContext to save
        
        do { try managedContext!.save() }
        catch { print("Error saving") }
        //performSegue(withIdentifier: "saveActivity", sender: sender)
        // this should segue to the next scene
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveActivity" || segue.identifier == "activityList" {
            let tableViewController = segue.destination as! BoredActivityTableViewController
            tableViewController.managedContext = managedContext
        }
        
    }
    
    
    

    


}

