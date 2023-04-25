//
//  user .swift
//  BoredApp
//
//  Created by Devin Guevara on 4/24/23.
//  Copyright © 2023 Cara. All rights reserved.
//

import Foundation
import ParseSwift

struct User: ParseUser {
    // These are required by `ParseObject`.
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    // These are required by `ParseUser`.
    var username: String?
    var email: String?
    var emailVerified: Bool?
    var password: String?
    var authData: [String: [String: String]?]?
    
}
    // Your custom properties.
    
