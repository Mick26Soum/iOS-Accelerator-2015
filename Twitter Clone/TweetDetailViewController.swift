//
//  TweetDetailViewController.swift
//  Twitter Clone
//
//  Created by Mick Soumphonphakdy on 8/6/15.
//  Copyright (c) 2015 Mick Soum. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
  
  var selectedTweet : Tweet!
  var screenname : String?
  

  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var tweet: UILabel!
  @IBOutlet weak var imageButton: UIButton!
  
  
  var imageURL : String!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      
      if let originalAuth = selectedTweet.originalAuthor,
        let originalTweet = selectedTweet.originalTweet,
        let originalImageURL = selectedTweet.originalProfileImageURL,
        let originalscreenname = selectedTweet.screenname{
        self.userName.text = originalAuth
        self.tweet.text = originalTweet
        self.imageURL = originalImageURL
        self.screenname = originalscreenname
      } 
      if let quoteAuth = selectedTweet.quotedAuthor,
         let quotedText = selectedTweet.quotedText,
         let quotedAuthorImageURL = selectedTweet.quotedAuthorImageURL,
         let quotedscreenname = selectedTweet.screenname{
          self.userName.text = quoteAuth
          self.tweet.text = quotedText
          self.imageURL = quotedAuthorImageURL
          self.screenname = quotedscreenname
      }
      else{
        self.userName.text = selectedTweet.username
        self.tweet.text = selectedTweet.text
        self.imageURL = selectedTweet.profileImageURL
        self.screenname = selectedTweet.screenname
      }
      
     
      
      //set the image down here
      if let imageURL = NSURL(string: imageURL),
      imageData = NSData(contentsOfURL: imageURL),
      image = UIImage(data: imageData){
        var size : CGSize
        switch UIScreen.mainScreen().scale{
                case 2:
                  size = CGSize(width: 120, height: 120)
                case 3:
                  size = CGSize(width: 240, height: 240)
                default:
                  size = CGSize(width: 60, height: 60)
                }
          
                let resizedImage = ImageResizer.resizeImage(image, size: size)
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                  self.imageButton.setImage(resizedImage, forState: .Normal)
                })
        
      }
      
    }
  
//  Set the variable/data sent to the usertime, initiate the screenname
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //userTimeLine
    if segue.identifier == "userTimeLine"{
      let TimelineViewController = segue.destinationViewController as! UserTimelineViewController
      TimelineViewController.screenname = screenname
      
      
    }
  }
  
}
