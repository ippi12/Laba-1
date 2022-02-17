//
//  ViewController.swift
//  Authentification
    //
    //  Created by Компьютер on 07.02.2022.
    //

    import UIKit

final class ViewController: UIViewController {
    
    let myTableView = UITableView()
    let headerView = HeaderView()
    private var dataSource: [CellType] = [.login, .password]
    
    let signButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.frame = .init(x: 0, y: 0, width: 0, height: 80)
        return button
    }()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            signTitle()
            setupTableView()
            setupLoginTableViewCell()
            setupHeaderView()
        }
        
        func signTitle() {
            view.backgroundColor = .white
            navigationItem.title = "Вход"
        }
        
        @objc func buttonPressed() {
            let alert = UIAlertController(title: "", message: "Вы вошли", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
        }
        
        func setupLoginTableViewCell() {
            myTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
//            myTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "CustomHeader")
            myTableView.tableHeaderView = headerView
            myTableView.tableFooterView = signButton
            myTableView.separatorStyle = .none
            myTableView.delegate = self
        }
        
        func setupTableView() {
            view.addSubview(myTableView)
            myTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
            myTableView.dataSource = self
            myTableView.alwaysBounceVertical = true
        }
//    Задаю размеры для myTableView.headerView
    func setupHeaderView() {
        headerView.frame = .init(x: 0, y: 0, width: 0, height: 80)
        headerView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configure(type: dataSource[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {

}

extension ViewController: HeaderViewDelegate {

    func headerView(_ headerView: HeaderView, didSelectSegmentedControl: Int) {
        switch didSelectSegmentedControl {
        case 0:
            dataSource = [.login, .password]
            myTableView.reloadData()
        case 1:
            dataSource = [.createLogin, .email, .createPassword, .repeatPassword]
            myTableView.reloadData()
        default:
            break
        }
    }
}
