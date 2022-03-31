//
//  Tweet.swift
//  Tweet
//
//  Created by 김민지 on 2022/03/31.
//

import Foundation

struct Tweet: Codable {
    let user: User
    let contents: String
}
