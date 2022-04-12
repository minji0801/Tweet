//
//  MockUserDefaultsManaer.swift
//  TweetTests
//
//  Created by 김민지 on 2022/04/12.
//

import XCTest
@testable import Tweet

final class MockUserDefaultsManaer: UserDefaultsManagerProtocol {
    var tweets: [Tweet] = []
    var newTweet: Tweet!
    
    var isCalledGetTweet = false
    var isCalledSetTweet = false
    
    func getTweet() -> [Tweet] {
        isCalledGetTweet = true
        return tweets
    }
    
    func setTweet(_ newValue: Tweet) {
        isCalledSetTweet = true
        self.newTweet = newValue
    }
    
    
}
