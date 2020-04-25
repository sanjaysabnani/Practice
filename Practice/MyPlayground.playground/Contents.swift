import Foundation


enum instanceType {
    case both
    case first
    case second
    case number
}

protocol ModularProtocol {
    
    func printString()
}

class Factory {
    
    var type : instanceType?
    
    func getInsatnce(type : instanceType, num : Int)-> ModularProtocol {
        switch type {
        case .both:
            return FizzBuzz(num)
        case .first:
            return Fizz(num)
        case .second:
            return Buzz(num)
        case .number:
            return Numbers(num)
        }
    }
}

class NumberProperty {
    var number : Int
    init(_ num : Int) {
        number = num
    }
    
    func isPrimeNo() -> Bool {
        
        if number == 2  && number == 3 {
            return true
        }
        
        var i = 2
        
        while i <= number/2 {
            
            if (number % i == 0) {
                return false
            }
            i += 1
        }
        
        return true
    }
    
    func printNumberProperties(_ printStr : String){
        var printStri = printStr
        if self.isPrimeNo(){
            printStri += " is Prime"
        }
        print(printStri)
    }
    
    
}


class Fizz: NumberProperty,ModularProtocol{
    func printString() {
        printNumberProperties("Fizz")
    }
    
    
}
class Buzz : NumberProperty,ModularProtocol{
    func printString() {
        printNumberProperties("Buzz")
    }
    
    
}
class FizzBuzz : NumberProperty,ModularProtocol{
    
    func printString() {
        printNumberProperties("FizzBuzz")
    }
    
}
class Numbers : NumberProperty,ModularProtocol{
    
    func printString() {
        let str = "\(number)"
        printNumberProperties(str)
    }
    
    
}

class Counter {
    
    var firstMod, secondMod : Int
    var modularInstances = [ModularProtocol]()
    init(_ first : Int, _ second : Int) {
        firstMod = first
        secondMod = second
    }
    
    func printMod(){
        
        for i in 1...100 {
            let instanceType : instanceType!
            if(i % (firstMod * secondMod) == 0){
                instanceType = .both
            }
            else if (i % firstMod == 0){
                instanceType = . first
            }
            else if (i % secondMod == 0){
                instanceType = .second
            }
            else {
                instanceType = .number
            }
            let mod = Factory().getInsatnce(type: instanceType,num: i)
            mod.printString()
        }
    }
}

let c1 = Counter(3,5)
c1.printMod()
