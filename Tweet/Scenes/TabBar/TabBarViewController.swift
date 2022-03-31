//
//  TabBarViewController.swift
//  Tweet
//
//  Created by 김민지 on 2022/03/31.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarViewControllers: [UIViewController] = TabBarItem.allCases
            .map { tabCase in
                let viewController = tabCase.viewController
                viewController.tabBarItem = UITabBarItem(
                    title: tabCase.title,
                    image: tabCase.icon.default,
                    selectedImage: tabCase.icon.selected
                )
                
                return viewController
            }

        self.viewControllers = tabBarViewControllers
    }
}

