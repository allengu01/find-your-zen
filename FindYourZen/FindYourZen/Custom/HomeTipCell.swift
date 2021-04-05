//
//  HomeGreetingCell.swift
//  FindYourZen
//
//  Created by Allen Gu on 3/21/21.
//

import UIKit

class HomeTipCell: UICollectionViewCell {
    var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var header: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.Poppins(.semibold, size: 22)
        label.textColor = UIColor(red: 46/255, green: 56/255, blue: 46/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "mindfulness tip"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var tip: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.Poppins(.regular, size: 16)
        label.textColor = UIColor(red: 46/255, green: 56/255, blue: 46/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "\"Mindfullness is a way of befriending ourselves and our experience.\" \n\t\t- Jon Kabat-Zinn"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cloud: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: "cloud")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.container)
        self.container.addSubview(self.header)
        self.container.addSubview(self.tip)
        self.container.addSubview(self.cloud)
        
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            self.container.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
            self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            self.container.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            self.header.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 16),
            self.header.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 20),
            self.header.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: -20),
            self.header.heightAnchor.constraint(equalToConstant: 24),
        ])
        NSLayoutConstraint.activate([
            self.tip.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 0),
            self.tip.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 24),
            self.tip.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: -24),
            self.tip.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            self.cloud.topAnchor.constraint(equalTo: self.container.topAnchor, constant: -20),
            self.cloud.leftAnchor.constraint(equalTo: self.container.rightAnchor, constant: -50),
            self.cloud.heightAnchor.constraint(equalToConstant: 39),
            self.cloud.widthAnchor.constraint(equalToConstant: 72.5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
