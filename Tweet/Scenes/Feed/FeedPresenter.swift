//
//  FeedPresenter.swift
//  Tweet
//
//  Created by 김민지 on 2022/03/31.
//

import Foundation
import UIKit

protocol FeedProtocol: AnyObject {
    func setupView()
}

final class FeedPresenter: NSObject {
    private weak var viewController: FeedProtocol?
    
    init(viewController: FeedProtocol?) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupView()
    }
}

extension FeedPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell
        
        let tweet = Tweet(user: User.shared, contents: "안녕하세요")
        cell?.setup(tweet: tweet)
        
        return cell ?? UITableViewCell()
    }
}

extension FeedPresenter: UITableViewDelegate {}
