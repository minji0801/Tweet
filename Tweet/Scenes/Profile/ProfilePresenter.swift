//
//  ProfilePresenter.swift
//  Tweet
//
//  Created by 김민지 on 2022/04/12.
//

import Foundation

protocol ProfileProtocol: AnyObject {
    func setupViews()
    func setViews(with name: String, account: String)
    func endEditing()
}

final class ProfilePresenter {
    private weak var viewController: ProfileProtocol?
    private var user: User {
        get { User.shared }
        set { User.shared = newValue }
    }
    
    init(viewController: ProfileProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupViews()
        viewController?.setViews(with: user.name, account: user.account)
    }
    
    func didTapSaveButton(name: String?, account: String?) {
        if name == nil || name == "" || account == nil || account == "" {
            return
        }
        
        viewController?.endEditing()
        
        if let name = name {
            user.name = name
        }
        
        if let account = account {
            user.account = account
        }
        
        viewController?.setViews(with: user.name, account: user.account)
    }
}
