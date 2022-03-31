//
//  User.swift
//  Tweet
//
//  Created by 김민지 on 2022/03/31.
//

import Foundation

struct User: Codable {
    var name: String
    var account: String
    
    static var shared = User(name: "iOS개발왕", account: "ios_developer")
}
