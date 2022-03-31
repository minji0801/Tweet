//
//  FeedPresenter.swift
//  Tweet
//
//  Created by 김민지 on 2022/03/31.
//

import Foundation

protocol FeedProtocol: AnyObject {}

final class FeedPresenter: NSObject {
    private weak var viewController: FeedProtocol?
    
    init(viewController: FeedProtocol?) {
        self.viewController = viewController
    }
}
