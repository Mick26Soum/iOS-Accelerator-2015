//
//  TwitterService.swift
//  Twitter Clone
//
//  Created by Mick Soumphonphakdy on 8/5/15.
//  Copyright (c) 2015 Mick Soum. All rights reserved.
//

import UIKit
import Accounts
import Social

class TwitterService {
  //This function takes in the ACAccount object credentials/access that were passed back from LoginService class
  //The completion handler function(argument) takes in a string and tweet struct as parameter, 
  //each parameter is assigned according to how the SLRequest reponse is sent back
  
  class func tweetsTimeline(account:ACAccount, completionHandler : (String?, [Tweet]?) -> (Void)){
    let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod:SLRequestMethod.GET, URL: NSURL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json")!, parameters: nil)
    request.account = account
    
    request.performRequestWithHandler { (data, response, error) -> Void in
      if let error = error{
        completionHandler("Could not connect to server", nil)
      }
      else{
        switch  response.statusCode{
        case 200...299:
          let tweets = TweetJSONParser.tweetsFromJSONData(data)
          completionHandler(nil,tweets)
        case 400...499:
          completionHandler("our app failed", nil)
        case 500...599:
          completionHandler("server error", nil)
        default:
          completionHandler("Error Occurred", nil)
        }
      }
    }
  }
  
  //class func userTweetsTimeline pass in the userName or id
}





