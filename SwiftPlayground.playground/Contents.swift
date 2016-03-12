//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let explicitDouble: Double = 70

let changliang: Float = 4

let label = "the width is "
let width = 94
//let widthLabel = label + String(width)

let widthlabel = "the width is \(width)"


var array = [1,2,3,4,5]
array[0] = 6

let emptyArray = [String]()


let indS = [75,43,103,87,12]
var totS = 0
for score in indS
{
    if score > 50
    {
        totS += 3
    }
    else{
        totS += 1}
}
print(totS)

var n = 2
while n < 100{
n *= 2
}
print(n)

var m = 2
repeat{
m *= 2
}while m < 100
print (m)


var firstForLoop = 0
//for i in 0..<4
for i in 0...4
{
    firstForLoop += i
}
print(firstForLoop)


func greet(name: String, day: String)-> String{
    return "Hello \(name), today is \(day)."
}

greet("Regulus", day: "Friday")

print(greet("R", day: "test"))


print("hello")


//var url = NSURL(string: "https://api.douban.com/v2/book/search?q=小王子")
//var str: AnyObject! = NSString.stringWithContentsofURL(url)
//print(str)

let session = NSURLSession.sharedSession()
let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/1003078")!)
let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
    let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
    print(string)
})
task.resume()




























