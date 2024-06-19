//
//  SearchView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 19/06/2024.
//


import Foundation
import UIKit
import SnapKit


class SearchView: UIView {
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter city name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(searchTextField)
        addSubview(searchButton)
        
        searchTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).inset(10)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
