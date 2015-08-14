//: Playground - noun: a place where people can play

import UIKit

var strName = "Test"
println("Hi \(strName)")

var screenname = "hey"

println("https://api.twitter.com/1.1/statuses/user_timeline.json?\(screenname)")



//:::::::::::::::::::                 Code Challenge Week 1             ::::::::::::::::::::::::::::::://

//Day 1 ::::::::::::::::::::::::: Write a function that reverses and array  :::::::::::::::::::::::::::::://
//source tutorial geeksforgeeks.org & weheartswift.com

func reverseArray(var array:[Int]) ->[Int] {
  
  
  var start = 0
  var end = array.count-1
  
  while start < end{
    
    var tempValu = array[start]
    array[start] = array[end]
    array[end] = tempValu
    
    ++start
    --end
  }
  return array
  
}


let strArray = [1,2,3,4]
println(reverseArray(strArray))


/*Day 2  :::::::::::::::::::: Print the numbers 1..100:::::::::::::::::::::::::
for multiples of 3, print "Fizz"
for multiples of 5 print "Buzz"
for mutliples of 3 & 5 print "FizzBuzz" */

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


/*Day 3:::::::::::Return the number of times that a string "hi" appears in a given string :::::::::
Source Tutorial https://github.com/ozelentok/CodingBat-Soultions/blob/master/Java/String-2.java */

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



/*Day 4. Given a string, return a version where all the "x" have been removed. Except an "x" at the very start or end should not be removed*/

var xString:String = "xsnedchedcxoshsnehsxox"
var xStringCharacter = Array(xString)
let firstChar = xStringCharacter.first
let lastChar = xStringCharacter.last


for var i = 0; i < xStringCharacter.count; ++i{
  
  if (xStringCharacter[i] == "x" && xStringCharacter[i] != firstChar && xStringCharacter[i] != lastChar) {
    xStringCharacter.removeAtIndex(i)
  }
}

/*Day Data Structure, implement a queue FIFO
Tutorial Source: Beginning Swift Programming by Wei-Meng Lee*/

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

/*Day 1********Code Challenge: Write a function that determines how many words there are in a sentence
geeksforgeeks.org*/

let strOfWords = "How many words are in this string? \t"
let blank = " "

//let whiteSpaceNewLine = NSCharacterSet.whitespaceAndNewlineCharacterSet()
//
//let wordArray = strOfWords.componentsSeparatedByString(" ")
//wordArray.count


func strCounter(str:String) -> Int{

  var state = false
  var wordcounter = 0
  
  for character in str{
    if character == " " || character == "\n" || character == "\t"{
      state = false
    }
    else if state == false{
      state = true
      ++wordcounter
    }
  }
  
  return wordcounter
  
}

strCounter(strOfWords)
strCounter(blank)



/*Day 2 ******Code Challenge: Write a function that returns all the odd elements of an array************/
let array = [1,3,5,6,8,10,12]

func oddElements(array:[Int]) -> [Int]{
  var oddArray = [Int]()
  
  for var i = 0; i < array.count; ++i{
    if array[i]%2 == 1{
      oddArray.append(array[i])
    }
    
  }
  return oddArray
}

oddElements(array)



//Day 3 Code Challenge: Write a function that computes the list of the first 100 Fibonacci numbers.

func fibonacci1(n: Int) -> Int {
  if n < 2 {
    return n
  }
  var fibPrev = 1
  var fib = 1
  for num in 2...n {
    (fibPrev, fib) = (fib, fib + fibPrev)
  }
  return fib
}

fibonacci1(100)


func fibonacci(n: Int) -> Int {
  if n < 2 {
    return n
  } else {
    return fibonacci(n-1) + fibonacci(n-2)
  }
}

println(fibonacci(30))






//int n, a = 0, b = 0, c = 1;
//System.out.print("Fibonacci Series:");
//for(int i = 1; i <= 100; i++)
//{
//  a = b;
//  b = c;
//  c = a + b;
//  System.out.print(a+" ");
//}


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

//http://www.geeksforgeeks.org/count-words-in-a-given-string/

//Given a string, count number of words in it. The words are separated by following characters: space (‘ ‘) or new line (‘\n’) or tab (‘\t’) or a combination of these.
//
//There can be many solutions to this problem. Following is a simple and interesting solution.
//The idea is to maintain two states: IN and OUT. The state OUT indicates that a separator is seen. State IN indicates that a word character is seen. We increment word count when previous state is OUT and next character is a word character.
//

///* Program to count no of words from given input string. */
//#include <stdio.h>
//
//#define OUT 0
//#define IN  1
//
//// returns number of words in str
//unsigned countWords(char *str)
//{
//  int state = OUT;
//  unsigned wc = 0;  // word count
//  
//  // Scan all characters one by one
//  while (*str)
//  {
//    // If next character is a separator, set the state as OUT
//    if (*str == ' ' || *str == '\n' || *str == '\t')
//    state = OUT;
//    
//    // If next character is not a word separator and state is OUT,
//    // then set the state as IN and increment word count
//    else if (state == OUT)
//    {
//      state = IN;
//      ++wc;
//    }
//    
//    // Move to next character
//    ++str;
//  }
//  
//  return wc;
//}


