//
//  ViewController.swift
//  Twitter Clone
//
//  Created by Mick Soumphonphakdy on 8/3/15.
//  Copyright (c) 2015 Mick Soum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var tweets = [Tweet]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.reloadData()
    
    if let filepath = NSBundle.mainBundle().pathForResource("tweet", ofType: "json"){
      if let data = NSData(contentsOfFile: filepath){
        if let tweets = TweetJSONParser.tweetsFromJSONData(data){
          
          self.tweets = tweets
        }
      }
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    let tweet = self.tweets[indexPath.row]
    cell.textLabel?.text = tweet.text
    
    return cell
    
  }
  
}

