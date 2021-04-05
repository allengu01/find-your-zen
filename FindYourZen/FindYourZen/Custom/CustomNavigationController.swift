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
//        self.navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
