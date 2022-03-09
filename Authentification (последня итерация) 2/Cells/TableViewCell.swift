//
//  LoginTableViewCell.swift
//  Authentification
//
//  Created by Компьютер on 07.02.2022.
//

import UIKit

enum CellType {
    case login
    case password
    case createLogin
    case email
    case createPassword
    case repeatPassword
}

protocol TextFieldTableViewDelegate: AnyObject {

    func placeholderChangedInCell(cell: TableViewCell,  placeholder: String)
    
}

final class TableViewCell: UITableViewCell {
    
    weak var delegate: TextFieldTableViewDelegate?
    
        var textFields: UITextField = {
           let textField = UITextField()
            textField.clearButtonMode = .whileEditing
            textField.textAlignment = .center
            textField.layer.cornerRadius = 10
            textField.font = UIFont.systemFont(ofSize: 16)
            textField.backgroundColor = .systemGray6
            return textField
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupUI() {
            selectionStyle = .none
            textFields.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(textFields)
            NSLayoutConstraint.activate([
                textFields.heightAnchor.constraint(equalToConstant: 50),
                textFields.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                textFields.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                textFields.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                textFields.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
            ])
        }
    
    func configure(type: CellType) {
        switch type {
        case .login:
            textFields.placeholder = "Введите логин"
        case .password:
            textFields.placeholder = "Введите пароль"
            textFields.isSecureTextEntry = true
        case .createLogin:
            textFields.placeholder = "Придумайте логин"
        case .email:
            textFields.placeholder = "Введите e-mail"
            textFields.isSecureTextEntry = false
        case .createPassword:
            textFields.placeholder = "Придумайте пароль"
            textFields.isSecureTextEntry = true
        case .repeatPassword:
            textFields.placeholder = "Повторите пароль"
            textFields.isSecureTextEntry = true
        }
    }
    
    func textChanged() {
        
    }
}
