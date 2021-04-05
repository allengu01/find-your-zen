//
//  MeditationViewController.swift
//  FindYourZen
//
//  Created by Allen Gu on 4/4/21.
//

import UIKit

class MeditationViewController: CustomViewController {

    var timer: Timer?
    var initialTime = 1800
    var secondsRemaining: Int!
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = formatTime()
        label.font = UIFont.Poppins(.semibold, size: 72)
        label.textColor = .white
        label.textAlignment = .center
        label.shadowColor = UIColor.darkGray
        label.shadowOffset = CGSize(width: 1.5, height: 1.5)
        label.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleTimer(_:)))
        label.addGestureRecognizer(gestureRecognizer)
        label.isUserInteractionEnabled = true

        label.layer.cornerRadius = 20
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var resetButton: UIButton = {
        let button = CustomButton()
        button.setTitle("reset", for: .normal)
        button.addTarget(self, action: #selector(resetTimer(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    func setup() {
        secondsRemaining = initialTime
        
        view.addSubview(timerLabel)
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerLabel.heightAnchor.constraint(equalToConstant: 240),
            timerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            timerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 60),
            resetButton.heightAnchor.constraint(equalToConstant: 48),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func formatTime() -> String {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    @objc func toggleTimer(_ sender: Any) {
        print("toggled")
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        else {
            timer!.invalidate()
            timer = nil
        }
    }
    
    @objc func resetTimer(_ sender: Any) {
        if timer != nil {
            timer!.invalidate()
        }
        timer = nil
        secondsRemaining = initialTime
        timerLabel.text = formatTime()
    }
    
    @objc func updateTimer() {
        secondsRemaining -= 1
        timerLabel.text = formatTime()
        if secondsRemaining == 0 {
            timer!.invalidate()
            timer = nil
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
