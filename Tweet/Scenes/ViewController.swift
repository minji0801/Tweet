//
//  ViewController.swift
//  Tweet
//
//  Created by 김민지 on 2022/03/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = UserDefaultsManager()
        manager.setTweet(Tweet(user: User.shared, account: "안녕하세요"))
        
        print(manager.getTweet())
    }


}

