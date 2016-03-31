//
//  DataResultsViewController.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/31/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit
import Charts

class DataResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    var months: [String]!
    
    
    func mockCellData(mybarChart : BarChartView) -> BarChartView {
        mybarChart.frame = CGRectMake(0, 0, self.view.frame.size.width, 400)
        mybarChart.noDataTextDescription = "Once your group responds to your question, you will have your results."
        months = ["1 Star", "2 Stars", "3 Stars", "4 Stars","5 Stars"]
        let unitsSold = [5.0, 4.0, 6.0,3.0,12.0]
        mybarChart.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<unitsSold.count {
            let dataEntry = BarChartDataEntry(value: unitsSold[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Current Rating")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        mybarChart.data = chartData
        mybarChart.descriptionText = ""
        chartDataSet.colors = ChartColorTemplates.joyful()
        mybarChart.xAxis.labelPosition = .Bottom
        mybarChart.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        mybarChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseOutQuad)
        self.view.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        
        return mybarChart

        
        
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 30
        }
        
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
        
        if indexPath.row == 0 {
            
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BarCell", forIndexPath: indexPath) as! BarChartTableViewCell
        
        cell.barChartView = self.mockCellData(cell.barChartView)
        
        return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as! QuestionTableViewCell
            return cell
        
        }
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath) as! CommentTableViewCell
            return cell
        }
        
}
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            
        
        if indexPath.row == 0 {
            return 400
        } else {
            return 140
            }
        } else {
            return 50
        }
    }

}



















