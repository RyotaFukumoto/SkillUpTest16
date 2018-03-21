//
//  TimelineViewController.swift
//  SkillUpTest16
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    let api = TweetAPI()
    let dateSource = TweetTableViewProvider ()
    var tweets: [Tweet] = []
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak private var activeView: UIActivityIndicatorView!
    @IBOutlet weak private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dateSource
        api.delegate = self
        activeViewFront()
        api.getTimeline()
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(TimelineViewController.refresh),
                                 for: UIControlEvents.valueChanged)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func refresh() {
        print("call refresh.")
        api.getTimeline()
        self.refreshControl.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func activeViewFront() {
        self.view.bringSubview(toFront: activeView)
        activeView.startAnimating()
    }
    
}

extension TimelineViewController: TweetAPIDelegate {
    func receivedTweets(tweets: [Tweet]) {
        dateSource.set(tweets: tweets)
        tableView.reloadData()
        activeView.stopAnimating()
        self.view.sendSubview(toBack: activeView)
    }
}
