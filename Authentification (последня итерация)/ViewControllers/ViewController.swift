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
    let footerView = FooterView()
    let tableViewCell = TableViewCell()
    private var dataSource: [CellType] = [.login, .password]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signTitle()
        setupTableView()
        setupTableViewCell()
        setupHeaderView()
        setupFooterView()
    }
    
    func signTitle() {
        view.backgroundColor = .white
    }
    
    @objc func buttonPressed() {
        let alert = UIAlertController(title: "", message: "Вы вошли", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
//      Задаю параметры таблицы
    
    func setupTableViewCell() {
        myTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        myTableView.tableHeaderView = headerView
        myTableView.tableFooterView = footerView
        myTableView.separatorStyle = .none
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.alwaysBounceVertical = true
    }
    
//     Задаю размеры таблицы
    
    func setupTableView() {
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
//    Задаю размеры и прокидываю делегат для myTableView.headerView
    
    func setupHeaderView() {
        headerView.frame = .init(x: 0, y: 0, width: 0, height: 80)
        headerView.headerDelegate = self
    }
    
//    Задаю размеры и прокидываю делеагт для myTableView.footerView
    
    func setupFooterView() {
        footerView.frame = CGRect(x: 0, y: 0, width: 0, height: 80)
    }
}

//     Конфигурирую ячейки

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

//  Реализую метод делегата для headerView

extension ViewController: HeaderViewDelegate {

    func headerView(_ headerView: HeaderView, didSelectSegmentedControl: Int) {
        switch didSelectSegmentedControl {
        case 0:
            dataSource = [.login, .password]
            footerView.configure(type: .login)
            myTableView.reloadData()
        case 1:
            dataSource = [.createLogin, .email, .createPassword, .repeatPassword]
            footerView.configure(type: .registration)
            myTableView.reloadData()
        default:
            break
        }
    }
}
