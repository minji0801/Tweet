//
//  MockProfileViewController.swift
//  TweetTests
//
//  Created by 김민지 on 2022/04/12.
//

import XCTest
@testable import Tweet

final class MockProfileViewController: ProfileProtocol {
    var isCalledSetupViews = false
    var isCalledSetViews = false
    var isCalledEndEditing = false
    var isCalledShowToast = false
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func setViews(with name: String, account: String) {
        isCalledSetViews = true
    }
    
    func endEditing() {
        isCalledEndEditing = true
    }
    
    func showToast() {
        isCalledShowToast = true
    }
}
