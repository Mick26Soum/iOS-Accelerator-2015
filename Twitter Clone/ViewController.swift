//
//  ViewController.swift
//  Twitter Clone
//
//  Created by Mick Soumphonphakdy on 8/3/15.
//  Copyright (c) 2015 Mick Soum. All rights reserved.


import UIKit //imports Foundation...always use UIKit
import Accounts


class ViewController: UIViewController {
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView!
  
  var tweets = [Tweet]()
  
  lazy var imageQueue = NSOperationQueue()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    self.tableView.reloadData()
    
    // 2 The line items below is required for the tableViewCell to adjust automatically
    self.tableView.estimatedRowHeight = 60
    self.tableView.rowHeight = UITableViewAutomaticDimension
    
    // call the LoginService
    LoginService.loginForTwitter { (errorDescription, account) -> (Void) in
      if let error = errorDescription{
        //how to do we go about warning the user in the line?
        //view UIAlertView?
      }
      if let account = account{
        TwitterService.tweetsTimeline(account, completionHandler: { (error, tweets) -> (Void) in
          //start animating the activity indicator before tweets are retrieved
          //remember to put it on the main queue as it's an interface object
          NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
            self.activityIndicator.startAnimating()
          })
          if let tweets = tweets{
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
              self.tweets = tweets
              //stop the activity indicator after tweets has been successfully retrieved
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                self.activityIndicator.stopAnimating()
              })
              self.tableView .reloadData()
            })
          }
        })
      }
    }
    
    
    //    if let filepath = NSBundle.mainBundle().pathForResource("tweet", ofType: "json"){
    //      if let data = NSData(contentsOfFile: filepath){
    //        if let tweets = TweetJSONParser.tweetsFromJSONData(data){
    //
    //          self.tweets = tweets
    //        }
    //      }
    //    }
    
  }
  
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      println()
      
      if segue.identifier == "tweetDetail"{
        
        let textDetailViewController = segue.destinationViewController as! TweetDetailViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow(){
          let tweet = self.tweets[indexPath.row]
          textDetailViewController.selectedTweet = tweet
        }
        
      }
      
    }
}


//MARK: UITableViewDatasource

extension ViewController : UITableViewDataSource{
  // required methods numberOfRowsInSection
  // Cell for Row at Index
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweets.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TweetTableViewCell
    cell.tag++
    let tag = cell.tag

    var tweet = self.tweets[indexPath.row]
    //cell.textLabel?.text = tweet.text
    cell.userNameLabel.text = tweet.username
    cell.tweetLabel.text = tweet.text
    cell.userImage.image = nil
    if let profileImage = tweet.profileImage{
      cell.userImage.image = profileImage
    }
    else{
  
        imageQueue.addOperationWithBlock({ () -> Void in
          if let imageURL = NSURL(string: tweet.profileImageURL),
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
                tweet.profileImage = resizedImage
                self.tweets[indexPath.row] = tweet
                if cell.tag == tag{
                  cell.userImage.image = resizedImage
                }
              })
              
          }

        })
    
  }
    
  
    
   
    
    return cell
    
  }
  
}






