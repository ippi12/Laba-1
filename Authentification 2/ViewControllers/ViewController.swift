//
//  ViewController.swift
//  Authentification
    //
    //  Created by Компьютер on 07.02.2022.
    //

    import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
        var myTableView = UITableView()
        
        let signButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.setTitle("Войти", for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            return button
        }()
        
       let segmentedControl: UISegmentedControl = {
           let sc = UISegmentedControl(items: ["Вход", "Регистрация"])
            sc.setEnabled(true, forSegmentAt: 0)
            sc.isEnabled = true
            sc.selectedSegmentIndex = 0
            sc.selectedSegmentTintColor = .systemBlue
            sc.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
            return sc
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            signTitle()
            setupTableView()
            setupLoginTableViewCell()
        }
        
        func signTitle() {
            view.backgroundColor = .white
            navigationItem.title = "Вход"
        }
        
        @objc func segmentChanged() {
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                show(ViewController(), sender: segmentedControl)
            case 1:
                show(RegistrationViewController(), sender: segmentedControl)
            default:
                break
            }
        }
        
        @objc func buttonPressed() {
            let alert = UIAlertController(title: "", message: "Вы вошли", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
        }
        
        func setupLoginTableViewCell() {
            myTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
            myTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "CustomHeader")
            myTableView.separatorStyle = .none
            myTableView.dataSource = self
            myTableView.delegate = self
            }
        
        func setupTableView() {
            view.addSubview(myTableView)
            myTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                //myTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            myTableView.heightAnchor.constraint(equalToConstant: 500)
            ])
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeader") as! CustomHeader
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        segmentedControl.heightAnchor.constraint(equalToConstant: 50),
        segmentedControl.widthAnchor.constraint(equalToConstant: 200),
        segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeader") as! CustomHeader
        view.addSubview(signButton)
        signButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        signButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        signButton.heightAnchor.constraint(equalToConstant: 50),
        signButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        return view
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 50
            }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
        }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: TableViewCell = myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.loginField.placeholder = "Введите логин"
            return cell
        default:
            let cell: TableViewCell = myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.loginField.placeholder = "Введите пароль"
            cell.loginField.isSecureTextEntry = true
            return cell
        }
    }
}
