//
//  CustomButton.swift
//  FindYourZen
//
//  Created by Allen Gu on 4/5/21.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 48.0)
        self.setTitle("start", for: .normal)
        self.titleLabel!.font = UIFont.Poppins(.semibold, size: 22)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(red: 157/255, green: 217/255, blue: 253/255, alpha: 1.0)
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
