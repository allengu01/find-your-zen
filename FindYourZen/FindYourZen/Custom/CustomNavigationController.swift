//
//  CustomNavigationController.swift
//  FindYourZen
//
//  Created by Allen Gu on 4/4/21.
//

import UIKit

class CustomNavigationController: UINavigationController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hidesBarsOnSwipe = true
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
}
