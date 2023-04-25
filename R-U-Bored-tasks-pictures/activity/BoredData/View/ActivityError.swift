//
//  ActivityError.swift
//  BoredData
//
//  Created by Nhi Huynh on 4/11/23.
//

import Foundation

class ActivityError: Error {
    let message: String
    
    init(message: String) {
        self.message = message
    }
}
