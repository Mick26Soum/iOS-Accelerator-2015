//
//  UserTimelineViewController.swift
//  Twitter Clone
//
//  Created by Mick Soumphonphakdy on 8/13/15.
//  Copyright (c) 2015 Mick Soum. All rights reserved.
//

import UIKit


class UserTimelineViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  
  var tweets = [Tweet]()
  var screenname : String!
  lazy var imageQueue = NSOperationQueue()
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.reloadData()
    
    tableView.estimatedRowHeight = 60
    tableView.rowHeight = UITableViewAutomaticDimension
    
    tableView.registerNib(UINib(nibName: "NibCellView", bundle:NSBundle.mainBundle()),
      forCellReuseIdentifier:"NibCellView")
    LoginService.loginForTwitter { (errorDescription, account) -> (Void) in
      if let error = errorDescription{
        //how to do we go about warning the user in the line?
        //view UIAlertView?
      }
      if let account = account{
        TwitterService.userTweetsTimeline(account, screen_name:self.screenname, completionHandler: { (error, tweets) -> (Void) in
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
   

    
    }//end of viewDidLoad
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//MARK: UITableViewDatasource,UITableViewDelegat
extension UserTimelineViewController : UITableViewDataSource, UITableViewDelegate{
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return tweets.count
    
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
   
    var cell = tableView.dequeueReusableCellWithIdentifier("NibCellView", forIndexPath: indexPath) as! NibCellView
    cell.tag++
    let tag = cell.tag
    
    var tweet = tweets[indexPath.row]
    
    cell.nameLabel.text = tweet.username
    cell.tweetLabel.text = tweet.text
    cell.locationLabel.text = tweet.text
    if let profileImage = tweet.profileImage{
      cell.imageButton.setImage(profileImage, forState: .Normal)
    }else{
      imageQueue.addOperationWithBlock({ () -> Void in
        if let imageURL = NSURL(string: tweet.profileImageURL),
        imageData = NSData(contentsOfURL: imageURL),
        image = UIImage(data: imageData){
          var size: CGSize
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
          tweet.profileImage  = resizedImage
          self.tweets[indexPath.row] = tweet
          if cell.tag == tag{
            cell.imageButton.setImage(image, forState: .Normal)
          }
        })
            
        }
      })
    }
    
    
    return cell
    
  }
  
}


  
 