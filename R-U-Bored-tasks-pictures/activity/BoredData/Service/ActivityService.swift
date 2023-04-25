//
//  ActivityService.swift
//  BoredData
//
//  Created by Nhi Huynh on 4/11/23.
//

import Foundation
import CoreData

class ActivityService {
    
    var activityDelegate: ActivityDelegate?
    
    let urlString = "https://www.boredapi.com/api/activity"
    
    func fetchRandomActivity(context: NSManagedObjectContext) {
        
        guard let delegate = activityDelegate else {
            print("Warning - no delegate set")
            return
        }
        
        let url = URL(string: urlString)
        let config = URLSessionConfiguration.default
        config.urlCache = nil
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url!, completionHandler: {(data, response, error) in
            
            if let error = error {
                delegate.activityFetchError(because: ActivityError(message: error.localizedDescription))
            }
            
            if let activityData = data {
                let decoder = JSONDecoder()
                
                // Got this code from Clara at https://github.com/claraj/github_core_data_ios
                decoder.userInfo[CodingUserInfoKey.context!] = context
                
                do {
                    let activityData = try decoder.decode(BoredActivity.self, from: activityData)
                    delegate.activityFetched(activity: activityData)
                    
                } catch {
                    delegate.activityFetchError(because: ActivityError(message: "Unable to parse"))
                }
            } else {
                delegate.activityFetchError(because: ActivityError(message: "Unable to get response from Bored API server"))
            }
            
        })
        
        task.resume()
    }
}
