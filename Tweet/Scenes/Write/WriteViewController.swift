//
//  WriteViewController.swift
//  Tweet
//
//  Created by 김민지 on 2022/04/10.
//

import SnapKit
import UIKit

final class WriteViewController: UIViewController {
    private lazy var presenter = WritePresenter(viewController: self)
    
    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            title: "닫기",
            style: .plain,
            target: self,
            action: #selector(didTapLeftBarButtonItem)
        )
        
        return barButtonItem
    }()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            title: "트윗",
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButtonItem)
        )
        
        return barButtonItem
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.textColor = .secondaryLabel
        textView.text = "무슨 일이 일어나고 있나요?"
        textView.font = .systemFont(ofSize: 16.0, weight: .medium)
        textView.delegate = self
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

// MARK: - TextView
extension WriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
    
    func textViewDidChange(_ textView: UITextView) {
        guard textView.textColor != .secondaryLabel else { return }
        
        rightBarButtonItem.isEnabled = !textView.text.isEmpty
    }
}

// MARK: - WriteProtocol Function
extension WriteViewController: WriteProtocol {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.addSubview(textView)
        
        let superviewInset: CGFloat = 16.0
        textView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(superviewInset)
            $0.leading.trailing.equalToSuperview().inset(superviewInset)
            $0.height.equalTo(160.0)
        }
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}

// MARK: - @objc Function
private extension WriteViewController {
    @objc func didTapLeftBarButtonItem() {
        presenter.didTapLeftBarButtonItem()
    }
    
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem(text: textView.text)
    }
}
