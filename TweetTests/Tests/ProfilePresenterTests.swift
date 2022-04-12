//
//  ProfilePresenterTests.swift
//  TweetTests
//
//  Created by 김민지 on 2022/04/12.
//

import XCTest
@testable import Tweet

class ProfilePresenterTests: XCTestCase {
    var sut: ProfilePresenter!
    
    var viewController: MockProfileViewController!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockProfileViewController()
        sut = ProfilePresenter(viewController: viewController)
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_요청될때() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupViews)
        XCTAssertTrue(viewController.isCalledSetViews)
    }
    
    // name이 존재하지 않을 때
    func test_didTapSaveButton이_요청될때_name이_존재하지않으면() {
        sut.didTapSaveButton(name: nil, account: "account")
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    // account이 존재하지 않을 때
    func test_didTapSaveButton이_요청될때_account가_존재하지않으면() {
        sut.didTapSaveButton(name: "name", account: nil)
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    // name과 account가 존재하지 않을 때
    func test_didTapSaveButton이_요청될때_name과_account가_존재하지않으면() {
        sut.didTapSaveButton(name: nil, account: nil)
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    // name과 account가 모두 존재할 때
    func test_didTapSaveButton이_요청될때_name과_account가_존재하면() {
        sut.didTapSaveButton(name: "name", account: "account")
        
        XCTAssertFalse(viewController.isCalledShowToast)
        XCTAssertTrue(viewController.isCalledEndEditing)
        XCTAssertTrue(viewController.isCalledSetViews)
    }
}
