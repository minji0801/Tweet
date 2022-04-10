//
//  TweetPresenter.swift
//  Tweet
//
//  Created by 김민지 on 2022/04/03.
//

import Foundation

protocol TweetProtocol: AnyObject {
    func setViews(tweet: Tweet)
    func setupViews()
}

final class TweetPresenter: NSObject {
    private weak var viewController: TweetProtocol?
    private let tweet: Tweet

    init(
        viewController: TweetProtocol?,
        tweet: Tweet
    ) {
        self.viewController = viewController
        self.tweet = tweet
    }
    
    func viewDidLoad() {
        viewController?.setViews(tweet: tweet)
        viewController?.setupViews()
    }
}
