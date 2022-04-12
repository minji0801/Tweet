//
//  WritePresenterTests.swift
//  TweetTests
//
//  Created by 김민지 on 2022/04/12.
//

import XCTest
@testable import Tweet

class WritePresenterTests: XCTestCase {
    var sut: WritePresenter!
    
    var viewController: MockWriteViewController!
    var userDefaultsManger: MockUserDefaultsManaer!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockWriteViewController()
        userDefaultsManger = MockUserDefaultsManaer()
        
        sut = WritePresenter(viewController: viewController, userDefaultsManager: userDefaultsManger)
    }
    
    override func tearDown() {
        sut = nil
        userDefaultsManger = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_요청되면() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_didTapLeftBarButtonItem이_요청되면() {
        sut.didTapLeftBarButtonItem()
        
        XCTAssertTrue(viewController.isCalledDismiss)
    }
    
    func test_didTapRightBarButtonItem이_요청되면() {
        sut.didTapRightBarButtonItem(text: "")
        
        XCTAssertTrue(userDefaultsManger.isCalledSetTweet)
        XCTAssertTrue(viewController.isCalledDismiss)
    }
}
