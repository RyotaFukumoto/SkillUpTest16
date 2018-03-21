//
//  TweetTableViewProvider.swift
//  SkillUpTest16
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//

import UIKit

class TweetTableViewProvider: NSObject {
    var tweets = [Tweet]()
    
    func set(tweets: [Tweet]) {
        self.tweets = tweets
    }
}

extension TweetTableViewProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
            as? TweetTableViewCell else {
                fatalError("Cellがありません")
        }
        
        cell.item = tweets[indexPath.row]
        return cell
    }
}
