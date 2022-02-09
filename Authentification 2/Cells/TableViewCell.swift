//
//  LoginTableViewCell.swift
//  Authentification
//
//  Created by Компьютер on 07.02.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
        var loginField: UITextField = {
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
            loginField.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(loginField)
            NSLayoutConstraint.activate([
                loginField.heightAnchor.constraint(equalToConstant: 50),
                loginField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                loginField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
                loginField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                loginField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)])
        }
}
