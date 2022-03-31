//
//  FeedViewController.swift
//  Tweet
//
//  Created by 김민지 on 2022/03/31.
//

import Foundation
import SnapKit
import UIKit

final class FeedViewController: UIViewController {
    private lazy var presenter = FeedPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        tableView.delegate = presenter
        
        tableView.register(
            FeedTableViewCell.self,
            forCellReuseIdentifier: FeedTableViewCell.identifier
        )
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension FeedViewController: FeedProtocol {
    func setupView() {
        navigationItem.title = "Feed"
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
