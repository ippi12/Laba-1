//
//  HeaderView.swift
//  Authentification
//
//  Created by Компьютер on 16.02.2022.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func headerView(_ headerView: HeaderView, didSelectSegmentedControl: Int)
}

class HeaderView: UIView {

    weak var headerDelegate: HeaderViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSegmentedControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Вход", "Регистрация"])
        segment.setEnabled(true, forSegmentAt: 0)
        segment.isEnabled = true
        segment.selectedSegmentIndex = 0
        segment.isMomentary = false
        segment.selectedSegmentTintColor = .systemBlue
        segment.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        return segment
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
        headerDelegate?.headerView(self, didSelectSegmentedControl: segmentedControl.selectedSegmentIndex)
    }
}
