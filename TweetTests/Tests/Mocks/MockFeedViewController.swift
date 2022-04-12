//
//  MockFeedViewController.swift
//  TweetTests
//
//  Created by 김민지 on 2022/04/12.
//

import XCTest
@testable import Tweet

final class MockFeedViewController: FeedProtocol {
    var isCalledSetupView = false
    var isCalledReloadTableView = false
    var isCalledMoveToTweetViewController = false
    var isCalledMoveToWriteViewController = false
    
    func setupView() {
        isCalledSetupView = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
    
    func moveToTweetViewController(with tweet: Tweet) {
        isCalledMoveToTweetViewController = true
    }
    
    func moveToWriteViewController() {
        isCalledMoveToWriteViewController = true
    }
}
