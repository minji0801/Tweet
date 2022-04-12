//
//  FeedPresenterTests.swift
//  TweetTests
//
//  Created by 김민지 on 2022/04/12.
//

import XCTest
@testable import Tweet

class FeedPresenterTests: XCTestCase {
    var sut: FeedPresenter!
    
    var viewController: MockFeedViewController!
    var userDefaultsManager: MockUserDefaultsManaer!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockFeedViewController()
        userDefaultsManager = MockUserDefaultsManaer()
        
        sut = FeedPresenter(viewController: viewController, userDefaultsManager: userDefaultsManager)
    }
    
    override func tearDown() {
        sut = nil
        userDefaultsManager = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_요청되면() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupView)
    }
    
    func test_viewWillAppear가_요청되면() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetTweet)
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
    
    func test_didTapWriteButton이_요청되면() {
        sut.didTapWriteButton()
        
        XCTAssertTrue(viewController.isCalledMoveToWriteViewController)
    }
}
