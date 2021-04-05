//
//  CustomSlider.swift
//  FindYourZen
//
//  Created by Allen Gu on 3/22/21.
//

import UIKit

class CustomSlider: UISlider {
    var valueLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        minimumTrackTintColor = UIColor(red: 180/255, green: 228/255, blue: 255/255, alpha: 1.0)
        maximumTrackTintColor = UIColor(red: 180/255, green: 228/255, blue: 255/255, alpha: 1.0)
        setThumbImage(UIImage(named: "slider-thumb"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
