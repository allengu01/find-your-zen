//
//  CheckinCollectionViewCell.swift
//  FindYourZen
//
//  Created by Allen Gu on 3/22/21.
//

import UIKit

class HomeCheckinCell: UICollectionViewCell {
    var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stressLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.Poppins(.semibold, size: 18)
        label.textColor = UIColor(red: 46/255, green: 56/255, blue: 46/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "stress level"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stressSlider: CustomSlider = {
        let slider: CustomSlider = CustomSlider()
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var stressValue: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.Poppins(.semibold, size: 14)
        label.textColor = UIColor(red: 46/255, green: 56/255, blue: 46/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var energyLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.Poppins(.semibold, size: 18)
        label.textColor = UIColor(red: 46/255, green: 56/255, blue: 46/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "energy"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var energySlider: CustomSlider = {
        let slider: CustomSlider = CustomSlider()
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var energyValue: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.Poppins(.semibold, size: 14)
        label.textColor = UIColor(red: 46/255, green: 56/255, blue: 46/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var happinessLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.Poppins(.semibold, size: 18)
        label.textColor = UIColor(red: 46/255, green: 56/255, blue: 46/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "stress level"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var happinessSlider: CustomSlider = {
        let slider: CustomSlider = CustomSlider()
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var happinessValue: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.Poppins(.semibold, size: 14)
        label.textColor = UIColor(red: 46/255, green: 56/255, blue: 46/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.container)
        self.container.addSubview(self.stressLabel)
        self.container.addSubview(self.stressSlider)
        self.container.addSubview(self.stressValue)
        self.container.addSubview(self.energyLabel)
        self.container.addSubview(self.energySlider)
        self.container.addSubview(self.energyValue)
        self.container.addSubview(self.happinessLabel)
        self.container.addSubview(self.happinessSlider)
        self.container.addSubview(self.happinessValue)
        
        stressValue.text = "\(Int(stressSlider.value))"
        stressSlider.valueLabel = stressValue
        energyValue.text = "\(Int(energySlider.value))"
        energySlider.valueLabel = energyValue
        happinessValue.text = "\(Int(happinessSlider.value))"
        happinessSlider.valueLabel = happinessValue
        
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            self.container.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
            self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            self.container.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            self.stressLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 20),
            self.stressLabel.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 20),
            self.stressLabel.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: 20),
            self.stressLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        NSLayoutConstraint.activate([
            self.stressValue.topAnchor.constraint(equalTo: self.stressLabel.bottomAnchor, constant: 16),
            self.stressValue.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: -10),
            self.stressValue.widthAnchor.constraint(equalToConstant: 30),
            self.stressValue.heightAnchor.constraint(equalToConstant: 20),
        ])
        NSLayoutConstraint.activate([
            self.stressSlider.topAnchor.constraint(equalTo: self.stressLabel.bottomAnchor, constant: 16),
            self.stressSlider.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 20),
            self.stressSlider.rightAnchor.constraint(equalTo: self.stressValue.leftAnchor, constant: -20),
            self.stressSlider.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            self.energyLabel.topAnchor.constraint(equalTo: self.stressSlider.bottomAnchor, constant: 20),
            self.energyLabel.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 20),
            self.energyLabel.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: 20),
            self.energyLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        NSLayoutConstraint.activate([
            self.energyValue.topAnchor.constraint(equalTo: self.energyLabel.bottomAnchor, constant: 16),
            self.energyValue.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: -10),
            self.energyValue.widthAnchor.constraint(equalToConstant: 30),
            self.energyValue.heightAnchor.constraint(equalToConstant: 20),
        ])
        NSLayoutConstraint.activate([
            self.energySlider.topAnchor.constraint(equalTo: self.energyLabel.bottomAnchor, constant: 16),
            self.energySlider.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 20),
            self.energySlider.rightAnchor.constraint(equalTo: self.energyValue.leftAnchor, constant: -20),
            self.energySlider.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            self.happinessLabel.topAnchor.constraint(equalTo: self.energySlider.bottomAnchor, constant: 20),
            self.happinessLabel.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 20),
            self.happinessLabel.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: 20),
            self.happinessLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        NSLayoutConstraint.activate([
            self.happinessValue.topAnchor.constraint(equalTo: self.happinessLabel.bottomAnchor, constant: 16),
            self.happinessValue.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: -10),
            self.happinessValue.widthAnchor.constraint(equalToConstant: 30),
            self.happinessValue.heightAnchor.constraint(equalToConstant: 20),
        ])
        NSLayoutConstraint.activate([
            self.happinessSlider.topAnchor.constraint(equalTo: self.happinessLabel.bottomAnchor, constant: 16),
            self.happinessSlider.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 20),
            self.happinessSlider.rightAnchor.constraint(equalTo: self.happinessValue.leftAnchor, constant: -20),
            self.happinessSlider.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSliders(viewController: HomeViewController) {
        print(viewController)
        stressSlider.addTarget(self, action: #selector(viewController.sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider!) {
    }
}
