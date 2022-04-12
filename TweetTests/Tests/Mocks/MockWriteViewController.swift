//
//  MockWriteViewController.swift
//  TweetTests
//
//  Created by 김민지 on 2022/04/12.
//

import XCTest
@testable import Tweet

final class MockWriteViewController: WriteProtocol {
    var isCalledSetupViews = false
    var isCalledDismiss = false
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func dismiss() {
        isCalledDismiss = true
    }
}
