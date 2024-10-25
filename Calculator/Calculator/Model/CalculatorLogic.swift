

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double,caclMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(input: String) -> Double? {
        if let n = number {
            switch input {
            case "+/-": return -n
            case "%": return n / 100
            case "AC": return 0
            case "=": return performTwoNumCalculation(n2: n)
            default: intermediateCalculation = (n1: n , caclMethod: input)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let method = intermediateCalculation?.caclMethod {
            switch method {
            case "+": return n1 + n2
            case "-": return n1 - n2
            case "×": return n1 * n2
            case "÷": return n1 / n2
            default: fatalError("Unknown calculation method: \(method)")
            }
        }
        return nil
    }
}

