//
//  HomeTodoCell.swift
//  FindYourZen
//
//  Created by Allen Gu on 3/28/21.
//

import UIKit

class HomeTodoCell: UICollectionViewCell {
    var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.Poppins(.semibold, size: 18)
        label.textColor = UIColor(red: 46/255, green: 56/255, blue: 46/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "start your day"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.container)
        self.container.addSubview(self.imageView)
        self.container.addSubview(self.title)
        
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            self.container.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
            self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            self.container.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 10),
            self.title.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 20),
            self.title.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: 20),
            self.title.heightAnchor.constraint(equalToConstant: 30),
        ])
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 20),
            self.imageView.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: -40),
            self.imageView.widthAnchor.constraint(equalToConstant: 100),
            self.imageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, imageName: String) {
        self.title.text = title
        self.imageView.image = UIImage(named: imageName)
    }
}
