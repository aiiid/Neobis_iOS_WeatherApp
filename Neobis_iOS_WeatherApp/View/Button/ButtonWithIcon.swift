//
//  WeatherForecastButton.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 15/06/2024.
//

import UIKit

class ButtonWithIcon: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String, icon: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(systemName: icon), for: .normal)
        configure()
    }
    
    private func configure(){
        setTitleColor(UIColor(hex: "444E72"), for: .normal)
        tintColor = UIColor(hex: "#444E72")
        
        semanticContentAttribute = .forceRightToLeft
        configuration?.imagePadding = 10
        
        layer.cornerRadius = 20
    }
    
    func set(backgroundColor: UIColor, title: String, icon: String){
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(systemName: icon), for: .normal)
    }

    
}
