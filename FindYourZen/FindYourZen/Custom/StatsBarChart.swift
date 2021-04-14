//
//  StatsBarChart.swift
//  FindYourZen
//
//  Created by Allen Gu on 4/6/21.
//

import UIKit
import Charts

class StatsBarChart: BarChartView {
    
    init() {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))
        formatBarChart()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func formatBarChart() {
        isUserInteractionEnabled = false
        
        // Format bar chart
        xAxis.labelFont = UIFont.Poppins(.regular, size: 12)
        xAxis.drawLabelsEnabled = false
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.axisLineWidth = 2
        xAxis.granularity = 1
        xAxis.axisLineColor = .black
        
        leftAxis.drawAxisLineEnabled = false
        leftAxis.drawGridLinesEnabled = false
        leftAxis.drawLabelsEnabled = false
        leftAxis.axisMinimum = 0
        leftAxis.axisMaximum = 10
//
//        leftAxis.labelFont = UIFont.Poppins(.regular, size: 12)
//        leftAxis.drawLabelsEnabled = false
//        leftAxis.axisLineColor = .black
//        leftAxis.drawGridLinesEnabled = false
//        leftAxis.granularity = 1
        
        rightAxis.enabled = false
        
        pinchZoomEnabled = false
        drawBarShadowEnabled = false
        legend.enabled = false
    }
}
