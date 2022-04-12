//
//  MockTweetViewController.swift
//  TweetTests
//
//  Created by 김민지 on 2022/04/12.
//

import XCTest
@testable import Tweet

final class MockTweetViewController: TweetProtocol {
    var isCalledSetViews = false
    var isCalledSetupViews = false
    
    func setViews(tweet: Tweet) {
        isCalledSetViews = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
}
