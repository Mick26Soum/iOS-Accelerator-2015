//: Playground - noun: a place where people can play

import UIKit
//






//:::::::::::::::::::                 Code Challenge Week 1             ::::::::::::::::::::::::::::::://

//Day 1 ::::::::::::::::::::::::: Write a function that reverses and array  :::::::::::::::::::::::::::::://
//source tutorial geeksforgeeks.org & weheartswift.com

func reverseArray(var array:[Int], var start:Int, var end:Int) {
  
  var tempValu:Int = 0
  
  while start < end{
    
    tempValu = array[start]
    array[start] = array[end]
    array[end] = tempValu
    
    start++
    end--
  }
  
}




//Day 2  :::::::::::::::::::: Print the numbers 1..100:::::::::::::::::::::::::
//                      for multiples of 3, print "Fizz"
//                      for multiples of 5 print "Buzz"
//                      for mutliples of 3 & 5 print "FizzBuzz"

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


//Day 3:::::::::::Return the number of times that a string "hi" appears in a given string :::::::::
//Source Tutorial https://github.com/ozelentok/CodingBat-Soultions/blob/master/Java/String-2.java

var paramString:String = "hellohiarehidoinghi"

let charactersArray = Array(paramString)
var stringlength = charactersArray.count
var counter = 0

for var i = 0; i < charactersArray.count; ++i{
  var next = i+1
  
  if charactersArray[i] == "h" && charactersArray[next] == "i"{
    counter++
  }
  
}



//Day 4. Given a string, return a version where all the "x" have been removed. Except an "x" at the very start or end should not be removed

var xString:String = "xsnedchedcxoshsnehsxox"
var xStringCharacter = Array(xString)
let firstChar = xStringCharacter.first
let lastChar = xStringCharacter.last

for var i = 0; i < xStringCharacter.count; ++i{
  
  if xStringCharacter[i] == "x" && xStringCharacter[i] != firstChar && xStringCharacter[i] != lastChar {
    xStringCharacter.removeAtIndex(i)
  }
}




//Day Data Structure, implement a queue FIFO
//Tutorial Source: Beginning Swift Programming by Wei-Meng Lee

class MyQueue{
  var elements = [Int]()
  
  func push(item:Int){
    elements.insert(item, atIndex: 0)
  }
  
  func pop(){
    if elements.count > 0{
      elements.removeLast()
    }
    
  }
}

var newQueue = MyQueue()
newQueue.push(8)
newQueue.push(9)
newQueue.push(10)
newQueue.pop()




  





//::::::::::::::::::::::::::::::::::::::Week 2 Code Challenge :::::::::::::::::::::::::::::::::::::::::::::://

//Code Challenge: Write a function that determines how many words there are in a sentence


//Code Challenge: Write a function that returns all the odd elements of an array

//Code Challenge: Write a function that computes the list of the first 100 Fibonacci numbers.

//Code Challenge: Write a function that tests whether a string is a palindrome










//////:::::Test Code:::::::::::://

//var i = 0
//for (i=0; i <= charactersArray.count; i++){
//
//  var newChar = charactersArray[i]
//  var startIndex = 0
//  var nextIndex = startIndex+1
//  var counter = 0
//
//  if i == 0{
//    startIndex = 0
//  }
//  else{
//    startIndex = i
//  }
//
//  if (charactersArray[startIndex] == 'h') && (charactersArray[nextIndex] == 'i'){
//    counter++
//  }

//if i = 0, then set the current index to 0 as start
//increment next index
//var startIndex = 0
//var nextIndex = startIndex+1
//else if i = startIndex
//evaluate charactersArray[startIndex].lowecase == 'h' & charactersArray[nextIndex] == 'i'
//counter++

//}


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

