import Foundation

// Clousers
// Ashok & Suraj: 10 Jul 2019

// MARK: Closure as Variable
var sampleClosure: ((String) -> Void)!

sampleClosure = { (sampleVariable: String) in
    print("sampleVariable: \(sampleVariable)")
}

sampleClosure("test")


// MARK: Closure as function parameter (@escaping & @noescaping)
// Synchronous clouser
func sampleFunction(para1: Int, closure: ((String) -> Void)) {
    closure("Closure as function parameter")
}

sampleFunction(para1: 1) { (sampleVariableInFunc: String) in
    print("sampleVariableInFunc: \(sampleVariableInFunc)")
}

// Asynchronous clouser
func sampleFunction1(para1: Int, closure: @escaping ((String) -> Void)) {
    DispatchQueue.main.async {
        closure("Closure as function parameter")
    }
    print("Just Testing")
}

sampleFunction1(para1: 1) { (sampleVariableInFunc: String) in // Declaring as trainling closure
    print("sampleVariableInFunc: \(sampleVariableInFunc)")
}

sampleFunction1(para1: 1, closure: { (sampleVariableInFunc: String) in // Declaring as normal closure
    print("sampleVariableInFunc: \(sampleVariableInFunc)")
})

// storing a closure
func sampleFunction2(para1: Int, closure: @escaping ((String) -> Void)) {
    sampleClosure = closure
}

sampleClosure?("test")
