//: Playground - noun: a place where people can play

import UIKit
//



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


//:::::::::::::::::::                 Code Challenge Week 1             ::::::::::::::::::::::::::::::://

//1. ::::::::::::::::::::::::: Write a function that reverses and array  :::::::::::::::::::::::::::::://
//source tutorial geeksforgeeks.org & weheartswift.com


func reverseArray(paramsArray:NSMutableArray){
  
  var startIndex = 0
  var lastIndex = paramsArray.count
  
  
  while startIndex < lastIndex-1{
    var tmp: AnyObject = paramsArray[startIndex]
    paramsArray[startIndex] = paramsArray[lastIndex]
    paramsArray[lastIndex] = tmp
    
    ++startIndex
    ++lastIndex
  }
  
}




//2.Print the numbers 1..100
// for multiples of 3, print "Fizz"
// for multiples of 5 print "Buzz"
// for mutliples of 3 & 5 print "FizzBuzz"

for number in 1...100 {
  
  var div3 = number % 3
  var div5 = number % 5
  
  if div3 == 0{
    println("Fizz")
  }
  else if div5 == 0{
    println("Buzz")
  }
  else if (div3 == 0) && (div5 == 0){
    println("FizzBuzz")
  }
}


//3.Return the number of times that a string "hi" appears in a given string

var paramString:String = "hellohiarehidoinghi"
//iterate through a string of characters, if the character is
//capital or lowercase h and next character is an i not case sensitve
//then add your counter
let charactersArray = Array(paramString)
println(charactersArray)

var i = 0
for (i=0; i <= charactersArray.count; i++){
  
  var newChar = charactersArray[i]
  
  //if i = 0, then set the current index to 0 as start
  //increment next index
  //var startIndex = 0
  //var nextIndex = startIndex+1
  
}


//let index = advance(paramString.startIndex, 1)
//let character = paramString[index]
//
//
//let string : String = "Hello 🐶🐮 🇩🇪"
//let characters = Array(string)
//println(characters)


//var arr = paramString.componentsSeparatedByString(" ")
//
//for word in arr{
//  var counter = 0
//  if word == "hi"{
//    counter++
//  }
//}


//Given a string, return a version where all the "x" have been removed.
//Except an "x" at the very start or end should not be removed
//Data Structure, implement a queue


//:::::::::::: Week 2 ::::::::::::::::::::://

//Code Challenge: Write a function that determines how many words there are in a sentence


//Code Challenge: Write a function that returns all the odd elements of an array

//Code Challenge: Write a function that computes the list of the first 100 Fibonacci numbers.

//Code Challenge: Write a function that tests whether a string is a palindrome
