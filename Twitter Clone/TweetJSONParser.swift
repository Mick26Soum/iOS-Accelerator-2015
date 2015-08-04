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
  
  //create instance of tweet struct and populate with data?
  //where is the JSON file coming from?
  
  //JSON file will be used to populate the tableview
  
  //define function
  //make the tweet return ? optional
  //make this a type method
  class func tweetsFromJSONData(jsonData:NSData) -> [Tweet]? {
    
    var error : NSError?  //see what error pops up when you don't have the question mark
    //& is the address of the error variable
    
    // serialize data to native object
    // add in optional binding, learn when to use optional binding
    // add in optional casting
    // force downcast use ! force downcase ? is optional  if there is an error this will crash
    // use optional binding when dealing with data
    // tweets are returned as an array, and dictionary within an array
    // cast this as [ [String : AnyObject ] ]
    if let rootObject =  NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [[String:AnyObject]]{
      
      
      //inititize your tweet array to hold tweets
      var tweets = [Tweet]()
      
      //loop through the array of tweets, tweets started out as an array
      for tweet in rootObject{
        //use combo optional binding to set the your tweets
        if let text = tweet["text"] as? String,
          authorDictionary = tweet["user"] as? [String : AnyObject]{
            
            if let username = authorDictionary["name"] as? String,
              id = authorDictionary["id_str"] as? String,
              profileImageURL = authorDictionary["profile_image_url"] as? String{
                println(username)
                // create your tweets here here
                let post = Tweet(text:text, username:username, id: id, profileImageURL:profileImageURL)
                tweets.append(post)
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


