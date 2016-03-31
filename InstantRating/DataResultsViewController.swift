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
        months = ["Jan", "Feb", "Mar", "Apr","May"," Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
        let unitsSold = [20.0, 4.0, 6.0,3.0,12.0,16.0,4.0,18.0,2.0,4.0,5.0,4.0]
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
        
    }

}
