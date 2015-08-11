//
//  Tweet.swift
//  Twitter Clone
//
//  Created by Mick Soumphonphakdy on 8/3/15.
//  Copyright (c) 2015 Mick Soum. All rights reserved.
//

import Foundation
import UIKit

struct Tweet {
  let text : String
  let username : String
  let id : String
  let profileImageURL : String
  var profileImage : UIImage?
  var originalAuthor : String?
  var originalTweet : String?
  var originalProfileImageURL : String?
  var quotedAuthor : String?
  var quotedText : String?
  var quotedAuthorImageURL : String?
  
  
}


//initialize it here

//let tweet = Tweet(text: "Hey", author: "Mick")
//let tweet = Tweet(text: <#String#>, username: <#String#>, id: <#String#>, profileImageURL: <#String#>, profileImage: <#UIImage?#>, originalAuthor: <#String?#>, originalTweet: <#String?#>, originalProfileImageURL: <#String#>, quotedAuthor: <#String?#>, quotedText: <#String?#>, quotedAutherImageURL: <#String#>)



