//
//  ActivityDelegate.swift
//  BoredData
//
//  Created by Nhi Huynh on 4/11/23.
// 
//

import Foundation

protocol ActivityDelegate {
    func activityFetched(activity: BoredActivity)
    func activityFetchError(because activityError: ActivityError)
}
