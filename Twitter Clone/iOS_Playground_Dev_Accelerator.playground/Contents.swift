//: Playground - noun: a place where people can play

import UIKit
//
//var str = "Hello, playground"
//
//// create an array of tweets
//
//var tweets = ["Dude What's Cracking?", "Tweet Number 2", "Tweet Number 3", "Put it order"]
//
//// custom function to sort
//
//var sortedTweets = sorted(tweets, >)
//print(sortedTweets)
//
//
//
////sample code from stackoverflow
//
//// http://stackoverflow.com/questions/25223058/how-to-sort-an-array-in-swift
//
//
//var names = [ "Alpha", "alpha", "bravo"]
//var sortedNames = names.sorted { $0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending }
//
//
//
//print(sortedNames)
//
//
////storing function in a variable
//
//func double (x:Int) -> Int{
//  return x * 2
//}
//
//let myDoubleFunction : (Int) -> (Int) = double
//
//myDoubleFunction(3)
//
//
//func changNumber(x: Int, changer : (Int) -> (Int)) -> Int {
//  
//  return changer(x)
//  
//}


//::::::::::::::::::::::::::::::::::::                 Code Challenge Week 1             ::::::::::::::::::::::::::::::://

//::::::::::::::::::::::::::::::::::::  Write a function that reverses and array         :::::::::::::::::::::::::::::::://

func reverseArray(paramArray:Array) -> Array?{
  
  var firstIndex = 0
  var lastIndex = paramArray.count - 1
  var reverseArray = [Int]()
  
  
  while firstIndex < lastIndex{
    var tempArray = paramArray[firstIndex] as! NSArray
    reverseArray[firstIndex] = paramArray[lastIndex] as! NSArray
    
    reverseArray[lastIndex] = reverseArray[firstIndex] as! NSArray
    
    ++firstIndex
    ++lastIndex
  }
  
  return nil
}



