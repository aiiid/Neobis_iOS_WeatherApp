//
//  CustomNavigationBar.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 15/06/2024.
//

import UIKit
import SnapKit

class CustomNavigationBar: UINavigationBar {
    
    let leftIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "mapPin.png"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let titleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return button
    }()
    
    let rightIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "notification.png"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        titleButton.setTitle(title, for: .normal) 
    }
    
    private func configure() {
        backgroundColor = .clear
        
        let stackView = UIStackView(arrangedSubviews: [leftIcon, titleButton])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        addSubview(rightIcon)
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        rightIcon.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
    
    func set(title: String) {
        titleButton.setTitle(title, for: .normal)
    }
}
