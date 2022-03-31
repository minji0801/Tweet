//
//  FeedViewController.swift
//  Tweet
//
//  Created by 김민지 on 2022/03/31.
//

import Foundation
import UIKit

final class FeedViewController: UIViewController {
    private lazy var presenter = FeedPresenter(viewController: self)
}

extension FeedViewController: FeedProtocol {}
