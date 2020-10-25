//
//  Owner.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/25/20.
//

import UIKit

// Struct to get nested value from API
struct NestedLink: Codable {
    let avatar: NestedAvatar
}

struct NestedAvatar: Codable {
    let href: String
}

class Owner: NSObject, Codable {
    var links: NestedLink?
    var avatarLink: String? {
        return links?.avatar.href
    }
}
