//
//  CustomTabBarController.swift
//  FindYourZen
//
//  Created by Allen Gu on 4/4/21.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = CustomNavigationController(rootViewController: HomeViewController())
        let breathingVC = CustomNavigationController(rootViewController: BreathingViewController())
        let meditationVC = CustomNavigationController(rootViewController: MeditationViewController())
        let chartsVC = CustomNavigationController(rootViewController: ChartsViewController())

        
        homeVC.title = "Home"
        breathingVC.title = "Breathing"
        meditationVC.title = "Meditation"
        chartsVC.title = "Charts"
        
        self.setViewControllers([homeVC, breathingVC, meditationVC, chartsVC], animated: false)
        
        guard let items = self.tabBar.items else {
            return
        }
        
        let images = ["home", "breathing", "meditation", "charts"]
        for i in 0..<items.count {
            items[i].image = UIImage(named: images[i])
        }
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
