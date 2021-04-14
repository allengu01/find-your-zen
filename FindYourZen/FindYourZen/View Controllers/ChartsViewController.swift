//
//  GraphsViewController.swift
//  FindYourZen
//
//  Created by Allen Gu on 4/4/21.
//

import UIKit
import Charts

class ChartsViewController: CustomViewController, ChartViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    var chartTitles = ["stress level", "energy", "happiness"]
    var labels: [Double] = []

    func generateData() -> [String: Any] {
        var values: [Double] = []
        for i in 0..<7 {
            labels.append(Date.init(timeIntervalSinceNow: -86400 * Double(6-i)).timeIntervalSince1970)
            values.append(Double(Int.random(in: 0...10)))
        }
        return ["labels": labels, "values": values]
    }
    
    
    weak var axisFormatDelegate: IAxisValueFormatter?

    lazy var stressBarChart: StatsBarChart = {
        let barChart = StatsBarChart()
        barChart.translatesAutoresizingMaskIntoConstraints = false
        barChart.delegate = self
        return barChart
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.makeLayout())
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ChartCell.self, forCellWithReuseIdentifier: "chart")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        axisFormatDelegate = self
//        view.addSubview(stressBarChart)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    func setData(_ barChart: BarChartView, _ labels: [Double], _ values: [Double]) {
        let dataEntries: [BarChartDataEntry] = (0..<values.count).map { (i) -> BarChartDataEntry in
            return BarChartDataEntry(x: Double(i), y: values[i])
        }
        
        let dataSet = BarChartDataSet(dataEntries)
        let data = BarChartData()
        data.addDataSet(dataSet)
        data.setDrawValues(false)
        dataSet.colors = [UIColor(red: 102/255, green: 47/255, blue: 255/255, alpha: 1.0)]
        barChart.data = data
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chart", for: indexPath) as? ChartCell {
            cell.configure(chartTitles[indexPath.section], self)
            let data = generateData()
            setData(cell.getChart(), data["labels"] as! [Double], data["values"] as! [Double])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return chartTitles.count
    }
    
    func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300)), subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20.0, leading: 50.0, bottom: 20.0, trailing: 50.0)
            section.orthogonalScrollingBehavior = .none
            return section
        }
        return layout
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

extension ChartsViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: Date(timeIntervalSince1970: labels[Int(value)]))
    }
}
