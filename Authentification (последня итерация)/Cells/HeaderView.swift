//
//  HeaderView.swift
//  Authentification
//
//  Created by Компьютер on 16.02.2022.
//

import UIKit

enum Page {
    case login
    case password
}

protocol HeaderViewDelegate: AnyObject {
    func headerView(_ headerView: HeaderView, didSelectSegmentedControl: Int)
}

class HeaderView: UIView {

    weak var delegate: HeaderViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSegmentedControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Вход", "Регистрация"])
         sc.setEnabled(true, forSegmentAt: 0)
         sc.isEnabled = true
         sc.selectedSegmentIndex = 0
         sc.selectedSegmentTintColor = .systemBlue
       sc.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
         return sc
     }()

    func addSegmentedControl() {
        addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        segmentedControl.heightAnchor.constraint(equalToConstant: 50),
        segmentedControl.widthAnchor.constraint(equalToConstant: 200),
        segmentedControl.centerYAnchor.constraint(equalTo: centerYAnchor),
        segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    @objc func segmentChanged() {
        delegate?.headerView(self, didSelectSegmentedControl: segmentedControl.selectedSegmentIndex)
    }
}
