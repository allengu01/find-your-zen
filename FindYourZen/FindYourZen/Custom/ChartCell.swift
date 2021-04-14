//
//  ChartCell.swift
//  FindYourZen
//
//  Created by Allen Gu on 4/6/21.
//

import UIKit
import Charts

class ChartCell: UICollectionViewCell {
    lazy var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.Poppins(.semibold, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var barChart: StatsBarChart = {
        let barChart = StatsBarChart()
        barChart.translatesAutoresizingMaskIntoConstraints = false
        return barChart
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(container)
        container.addSubview(title)
        container.addSubview(barChart)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            container.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            container.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            title.heightAnchor.constraint(equalToConstant: 30),
            title.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20),
            title.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            barChart.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            barChart.heightAnchor.constraint(equalToConstant: 200),
            barChart.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20),
            barChart.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ title: String, _ vc: ChartViewDelegate) {
        self.title.text = title
        barChart.delegate = vc
    }
    
    func getChart() -> BarChartView {
        return barChart
    }
}
