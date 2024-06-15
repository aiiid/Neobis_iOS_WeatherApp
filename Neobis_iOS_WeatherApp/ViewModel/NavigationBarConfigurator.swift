//
//  CustomNavigationBarConfigurator.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 15/06/2024.
//

import UIKit
import SnapKit

class NavigationBarConfigurator {
    
    static func createCustomNavigationBar(with title: String) -> UIView {
        let leftIcon = UIImageView(image: UIImage(named: "mapPin.png"))
        leftIcon.tintColor = .white
        
        let titleButton = UIButton(type: .system)
        titleButton.setTitle(title, for: .normal)
        titleButton.tintColor = .white
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        let chevronIcon = UIImageView()
        chevronIcon.image = UIImage(systemName: "chevron.down")
        chevronIcon.tintColor = .white
        chevronIcon.contentMode = .scaleAspectFit
        
        let stackView = UIStackView(arrangedSubviews: [leftIcon, titleButton, chevronIcon])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        
        let containerView = UIView()
        containerView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return containerView
    }
    
    static func createRightBarButtonItem() -> UIBarButtonItem {
        let rightIcon = UIBarButtonItem(
            image: UIImage(named: "notification.png"),
            style: .plain,
            target: nil,
            action: nil
        )
        rightIcon.tintColor = .white
        return rightIcon
    }
}
