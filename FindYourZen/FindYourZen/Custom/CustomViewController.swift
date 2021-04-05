//
//  CustomViewController.swift
//  FindYourZen
//
//  Created by Allen Gu on 3/21/21.
//

import UIKit

public class CustomViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.Poppins(.semibold, size: 24)
        label.text = "find your zen"
        label.textAlignment = .left
        return label
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        // Do any additional setup after loading the view.
    }
    
    func setGradientBackground() {
        print(self)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.init(red: 154/255, green: 217/255, blue: 253/255, alpha: 1.0).cgColor,
                                UIColor.init(red: 202/255, green: 183/255, blue: 255/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.shouldRasterize = true
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setTitle() {
        let leftItem = UIBarButtonItem(customView: label)
        let emptySpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
         emptySpace.width = 20
        self.navigationItem.leftBarButtonItems = [emptySpace, leftItem]
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
