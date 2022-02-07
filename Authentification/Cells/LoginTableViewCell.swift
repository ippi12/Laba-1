//
//  LoginTableViewCell.swift
//  Authentification
//
//  Created by Компьютер on 07.02.2022.
//

import UIKit

class LoginTableViewCell: UITableViewCell {
    
//    var loginLabel: UILabel = {
//            let label = UILabel()
//            label.text = "Логин"
//            label.font = UIFont.systemFont(ofSize: 16)
//            label.textAlignment = .center
//            label.backgroundColor = UIColor.systemGray2
//            return label
//        }()
//
        var loginField: UITextField = {
           let textField = UITextField()
            textField.clearButtonMode = .whileEditing
            textField.placeholder = "Введите имя учётной записи"
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
            //loginView.translatesAutoresizingMaskIntoConstraints = false
//            loginLabel.translatesAutoresizingMaskIntoConstraints = false
            loginField.translatesAutoresizingMaskIntoConstraints = false

            //contentView.addSubview(loginView)
//            contentView.addSubview(loginLabel)
            contentView.addSubview(loginField)
            NSLayoutConstraint.activate([
                /*loginView.heightAnchor.constraint(equalToConstant: 50),
                loginView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                loginView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
                loginView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 110),
                loginView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),*/
                
//                loginLabel.heightAnchor.constraint(equalToConstant: 50),
//                loginLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//                loginLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
//                loginLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
//                loginLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -200),
//
                loginField.heightAnchor.constraint(equalToConstant: 50),
                loginField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                loginField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
                loginField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                loginField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)])
        }
}
