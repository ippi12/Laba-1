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
    var isValid = false
    var mode = Page.login
    
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
        footerView.footerViewDelegate = self
        
    }
    
    func checkIsValid() {
        let login = (myTableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! TableViewCell).textFields.text!
        let password = (myTableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as! TableViewCell).textFields.text!
        switch mode {
        case .login:
            isValid = LoginHelper.isValidLogin(login)
            && PasswordHelper.isValidPassword(password)
            && login == LoginManager.login
            && password == LoginManager.password
        case .registration:
            let createLogin = (myTableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! TableViewCell).textFields.text!
            let email = (myTableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as! TableViewCell).textFields.text!
            let createPassword = (myTableView.cellForRow(at: IndexPath.init(row: 2, section: 0)) as! TableViewCell).textFields.text!
            let repeatPassword = (myTableView.cellForRow(at: IndexPath.init(row: 3, section: 0)) as! TableViewCell).textFields.text!
            isValid = LoginHelper.isValidLogin(createLogin)
            && PasswordHelper.isValidPassword(createPassword)
            && EmailHelper.isValidEmail(email)
            && createPassword == repeatPassword
            LoginManager.login = createLogin
            LoginManager.password = createPassword
            LoginManager.email = email
        }
    }
    
    func textFieldBolderColor() {
        if isValid == true {
            
        }
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

extension ViewController: FooterViewDelegate {
    
    func footerViewTapped(_footerView: FooterView, param: UIButton) {
        checkIsValid()
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        switch mode {
        case .login:
            if isValid == true {
                alert.message = "Вы вошли"
            }else{
                alert.message = "Неверный логин или пароль"
            }
            self.present(alert, animated: true, completion: nil)
        case .registration:
            if isValid == true {
                alert.message = "Вы зарегистрировались"
                self.present(alert, animated: true, completion: nil)
                headerView.segmentedControl.selectedSegmentIndex = 0
            }else{
                alert.message = "Неверные данные"
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension ViewController: HeaderViewDelegate {

    func headerView(_ headerView: HeaderView, didSelectSegmentedControl: Int) {
        switch didSelectSegmentedControl {
        case 0:
            mode = .login
            dataSource = [.login, .password]
            footerView.configure(type: .login)
            myTableView.reloadData()
        case 1:
            mode = .registration
            dataSource = [.createLogin, .email, .createPassword, .repeatPassword]
            footerView.configure(type: .registration)
            myTableView.reloadData()
        default:
            break
        }
    }
}
