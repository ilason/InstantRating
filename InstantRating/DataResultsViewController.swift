//
//  DataResultsViewController.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/31/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit
import Charts

class DataResultsViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView.noDataTextDescription = "Once your group responds to your question, you will have your results."
        months = ["1 Star", "2 Stars", "3 Stars", "4 Stars","5 Stars"]
        let unitsSold = [5.0, 4.0, 6.0,3.0,12.0]
        setChart(months, values: unitsSold)
        
    }
    var months: [String]!
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        barChartView.data = chartData
        barChartView.descriptionText = ""
        chartDataSet.colors = ChartColorTemplates.joyful()
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseOutQuad)
       // chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
        
    }

}
