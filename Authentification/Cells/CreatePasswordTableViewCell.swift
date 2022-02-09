//
//  CreatePasswordTableViewCell.swift
//  Authentification
//
//  Created by Компьютер on 07.02.2022.
//

import UIKit

class CreatePasswordTableViewCell: UITableViewCell {

    var passField: UITextField = {
       let textField = UITextField()
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "Придумайте пароль"
        textField.isSecureTextEntry = true
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
//            passLabel.translatesAutoresizingMaskIntoConstraints = false
        passField.translatesAutoresizingMaskIntoConstraints = false

        //contentView.addSubview(loginView)
//            contentView.addSubview(passLabel)
        contentView.addSubview(passField)
        NSLayoutConstraint.activate([
            /*loginView.heightAnchor.constraint(equalToConstant: 50),
            loginView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            loginView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            loginView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 110),
            loginView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),*/
            
//                passLabel.heightAnchor.constraint(equalToConstant: 50),
//                passLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//                passLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
//                passLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
//                passLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -200),
//
            passField.heightAnchor.constraint(equalToConstant: 50),
            passField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            passField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            passField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            passField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)])
    }
}
