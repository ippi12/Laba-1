//
//  FoterView.swift
//  Authentification
//
//  Created by Компьютер on 17.02.2022.
//

import UIKit

enum Page {
    case login
    case registration
}

protocol FooterViewDelegate: AnyObject {
    func footerViewTapped(_footerView: FooterView, param: UIButton)
    
}

class FooterView: UIView {
    
    var footerViewDelegate: FooterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSignButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var signButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    func setupSignButton() {
        addSubview(signButton)
        signButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.widthAnchor.constraint(equalToConstant: 200),
            signButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(type: Page) {
        switch type {
        case .login:
            signButton.setTitle("Войти", for: .normal)
        case .registration:
            signButton.setTitle("Зарегистрироваться", for: .normal)
        }
    }
    
    @objc func buttonTapped(param: UIButton) {
        footerViewDelegate?.footerViewTapped(_footerView: self, param: param)
    }
    
}
