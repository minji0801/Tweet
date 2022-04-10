//
//  TweetViewController.swift
//  Tweet
//
//  Created by 김민지 on 2022/04/03.
//

import SnapKit
import UIKit

final class TweetViewController: UIViewController {
    private var presenter: TweetPresenter!

    /// 프로필 이미지 뷰
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 30.0
        
        return imageView
    }()
    
    /// 사용자 이름 라벨
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        
        return label
    }()
    
    /// 사용자 계정 라벨
    private lazy var userAccountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    /// 내용 라벨
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    /// 좋아요 버튼
    private lazy var isLikedButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.like.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    /// 공유 버튼
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.share.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    init(tweet: Tweet) {
        super.init(nibName: nil, bundle: nil)
        
        presenter = TweetPresenter(viewController: self, tweet: tweet)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension TweetViewController: TweetProtocol {
    func setViews(tweet: Tweet) {
        userNameLabel.text = tweet.user.name
        userAccountLabel.text = "@\(tweet.user.account)"
        contentsLabel.text = tweet.contents
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let userInfoStackView = UIStackView(arrangedSubviews: [userNameLabel, userAccountLabel])
        userInfoStackView.axis = .vertical
        userInfoStackView.distribution = .equalSpacing
        userInfoStackView.spacing = 4.0
        
        let buttonStackView = UIStackView(arrangedSubviews: [isLikedButton, shareButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        [profileImageView, userInfoStackView, contentsLabel, buttonStackView].forEach {
            view.addSubview($0)
        }
        
        let superviewMargin: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superviewMargin)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(superviewMargin)
            $0.width.height.equalTo(60.0)
        }
        
        userInfoStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8.0)
            $0.trailing.equalToSuperview().inset(superviewMargin)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalTo(userInfoStackView.snp.trailing)
            $0.top.equalTo(profileImageView.snp.bottom).offset(8.0)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalTo(userInfoStackView.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(superviewMargin)
        }
    }
}
