//
//  GraphsViewController.swift
//  FindYourZen
//
//  Created by Allen Gu on 4/4/21.
//

import UIKit

class ChartsViewController: CustomViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.setGradientBackground()
        super.viewWillAppear(animated)
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
