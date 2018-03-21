//
//  TweetrAPI.swift
//  SkillUpTest16
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//

import Alamofire
import Foundation
import TwitterKit

protocol TweetAPIDelegate: class {
    func receivedTweets(tweets: [Tweet])
}

final class TweetAPI {
    
    let tweetResponse = TweetResponse()
    weak var delegate: TweetAPIDelegate?
    
    func getTimeline() {
        
        let net = NetworkReachabilityManager()
        net?.startListening()
        if  net?.isReachable ?? false {
            
            if let session = TWTRTwitter.sharedInstance().sessionStore.session() {
                print("@\(session.userID)でログインしました")
                var clientError: NSError?
                
                let apiClient = TWTRAPIClient(userID: session.userID)
                let request = apiClient.urlRequest(
                    withMethod: "GET",
                    urlString: "https://api.twitter.com/1.1/statuses/home_timeline.json",
                    parameters: [
                        "user_id": session.userID,
                        "count": "20"
                    ],
                    error: &clientError
                )
                
                apiClient.sendTwitterRequest(request) { _, data, error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let data = data {
                        let resultList = self.tweetResponse.map(json: data)
                        self.delegate?.receivedTweets(tweets: resultList)
                    }
                }
            } else {
                TWTRTwitter.sharedInstance().logIn { session, error in
                    guard let session = session else {
                        if let error = error {
                            print("エラーが起きました => \(error.localizedDescription)")
                        }
                        return
                    }
                    print("@\(session.userName)でログインしました")
                    self.getTimeline()
                }
            }
        } else {
            offLineAlert()
        }
    }
    
    func offLineAlert() {
        let alert: UIAlertController =
            UIAlertController(title: "オフライン",
                              message: "通信環境の良い場所で再度お試しください。",
                              preferredStyle: UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK",
                                                         style: UIAlertActionStyle.default,
                                                         handler: {(_: UIAlertAction?) -> Void in
                                                            self.getTimeline()
        })
        alert.addAction(defaultAction)
        var baseView = UIApplication.shared.keyWindow?.rootViewController
        if (baseView?.presentedViewController) != nil {
            baseView = baseView?.presentedViewController
        }
        baseView?.present(alert, animated: true, completion: nil)
    }
    
}
