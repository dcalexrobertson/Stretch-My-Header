//
//  MasterViewController.swift
//  Stretch My Header
//
//  Created by Alex on 2015-11-24.
//  Copyright © 2015 Alex. All rights reserved.
//

import UIKit

private let kTableHeaderHeight: CGFloat = 300
private let kTableHeaderCutAway: CGFloat = 80

class MasterViewController: UITableViewController {

    // MARK: Properties
    
    var newsItems = [NewsItem]()
    var headerView: UIView!
    var headerMaskLayer: CAShapeLayer!
    
    let effectiveHeight = kTableHeaderHeight - kTableHeaderCutAway / 2

    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        navigationController?.navigationBarHidden = true
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset.y = -effectiveHeight
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blackColor().CGColor
        headerView.layer.mask = headerMaskLayer
        
        updateHeaderView()
        
        createArrayOfNewsItems()
        
        //create date label
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateLabel.text = dateFormatter.stringFromDate(NSDate())
        
    }

    func updateHeaderView() {
        
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + kTableHeaderCutAway/2
        }
        
        headerView.frame = headerRect
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x: 0, y: headerRect.height - kTableHeaderCutAway))
        
        headerMaskLayer?.path = path.CGPath
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: - Scroll View
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsItemCell", forIndexPath: indexPath) as! NewsTableViewCell

        let newsItem = newsItems[indexPath.row] 
        
        cell.newsItem = newsItem
        
        return cell
    }
    
    // MARK: - Create Data
    
    func createArrayOfNewsItems() {
        
        newsItems.append(NewsItem(category: Category.World, headline: "Climate change protests, divestments meet fossil fuels realities"))
        newsItems.append(NewsItem(category: Category.Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"))
        newsItems.append(NewsItem(category: Category.MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"))
        newsItems.append(NewsItem(category: Category.Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"))
        newsItems.append(NewsItem(category: Category.AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting"))
        newsItems.append(NewsItem(category: Category.Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"))
        newsItems.append(NewsItem(category: Category.World, headline: "South Africa in $40 billion deal for Russian nuclear reactors"))
        newsItems.append(NewsItem(category: Category.Europe, headline: "'One million babies' created by EU student exchanges"))
    }

}

