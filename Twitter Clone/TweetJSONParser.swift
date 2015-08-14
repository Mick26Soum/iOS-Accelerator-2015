//
//  TweetJSONParser.swift
//  Twitter Clone
//
//  Created by Mick Soumphonphakdy on 8/3/15.
//  Copyright (c) 2015 Mick Soum. All rights reserved.
//

import UIKit
import Foundation

class TweetJSONParser {
  
  class func tweetsFromJSONData(jsonData:NSData) -> [Tweet]? {
    
    var error : NSError?
    
    if let rootObject =  NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [[String:AnyObject]]{
      //always evaluate the root object type in a JSON data, this will determine how you cast you data as either
      //an array of dicitonary [[String:AnyObject]] or just and array [String:AnyObject]
      
      //inititize your tweet array to hold tweets
      var tweets = [Tweet]()
      
      for tweetObject in rootObject{
        //use combo optional binding to set the your tweets
        if let text = tweetObject["text"] as? String,
          
          authorDictionary = tweetObject["user"] as? [String:AnyObject]{
            if let username = authorDictionary["name"] as? String,
                   id = authorDictionary["id_str"] as? String,
                   profileImageURL = authorDictionary["profile_image_url"] as? String,
                   screenname = authorDictionary["screen_name"] as? String,
                   location = authorDictionary["location"] as? String,
                   profileImageBackgroundURL = authorDictionary["profile_background_image_url"] as? String
            
            {
              
              var tweet = Tweet(text: text,
                      username: username,
                      id: id, profileImageURL: profileImageURL,
                      profileImage: nil,
                      originalAuthor: nil,
                      originalTweet: nil,
                      originalProfileImageURL: nil,
                      quotedAuthor: nil,
                      quotedText: nil,
                      quotedAuthorImageURL: nil,
                      profileImageBackgroundURL:nil,
                      orginialImageBackgroundURL:nil,
                      quotedImageBackgroundURL:nil,
                      location : location,
                      screenname : screenname,
                      originalScreenname : nil,
                      quotedScreenname : nil)
              
              if let retweet_status = tweetObject["retweet_status"] as? [String:AnyObject],
                let originalTweet = retweet_status["text"] as? String{
                  if let user = retweet_status["user"] as? [String:AnyObject]{
                    if let originalName = user["name"] as? String,
                      let originalProfileImageURL = user["profile_image_url"] as? String,
                      let originalScreenname = user["screen_name"] as? String{
                        tweet.originalAuthor = originalName
                        tweet.originalTweet = originalTweet
                        tweet.originalProfileImageURL = originalProfileImageURL
                        tweet.originalScreenname = originalScreenname
                    }
                  }
              }
              if let quoted_status = tweetObject["quoted_status"] as? [String:AnyObject],
                let quotedText = quoted_status["text"] as? String{
                  if let user = quoted_status["user"] as? [String:AnyObject]{
                    if let quotedName = user["name"] as? String,
                      let quotedAuthorImageURL = user["profile_image_url"] as? String,
                      let quotedScreenname = user["screen_name"] as? String{
                        tweet.quotedAuthor = quotedName
                        tweet.quotedText = quotedText
                        tweet.quotedAuthorImageURL = quotedAuthorImageURL
                        tweet.quotedScreenname = quotedScreenname
                    }
                  }
              }
              //move append here because the tweet Struct of copied and not by reference
              tweets.append(tweet)
            }
        }
        else{
          
        }
      }
      return tweets
    }
    
    return nil // since our class is returning [Tweets] object as optional we can catch this with nil
    
  }
}





// in your parser class
// [ [String : AnyObject ] ]
//update the cast, it's not a string but an array (root) for twitter


//Note to self
//Analyze the JSON and determine on wether or not the data comes back as a dictionary first or array
//If Dictionary...we need to grab the key for the rootObject after deserialization
//and cast the object as either [String : AnyObject] == dictionary
//then within the dictionary it has objects of arrays, so now we want to cast it down to [[String: AnyObject]] == this is indication of array and dictionary within the array objects
//


