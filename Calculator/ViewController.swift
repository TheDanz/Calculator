import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelNumber: UILabel!
    var isLastNumberSymbol : Bool = true
    var isNumberDisplayed : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isNumberDouble(_ number: Double) -> Bool {
        if number.decimalCount() == 0 {
            return false
        }
        return true
    }
    
    @IBAction func ClickAC(_ sender: Any) {
        labelNumber.text = "0"
        isLastNumberSymbol = true
        isNumberDisplayed = true
    }
    
    @IBAction func Click0(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "0"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func Click1(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "1"
        } else {
            labelNumber.text = "1"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func Click2(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "2"
        } else {
            labelNumber.text = "2"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func Click3(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "3"
        } else {
            labelNumber.text = "3"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func Click4(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "4"
        } else {
            labelNumber.text = "4"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func Click5(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "5"
        } else {
            labelNumber.text = "5"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func Click6(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "6"
        } else {
            labelNumber.text = "6"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func Click7(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "7"
        } else {
            labelNumber.text = "7"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func Click8(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "8"
        } else {
            labelNumber.text = "8"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func Click9(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "9"
        } else {
            labelNumber.text = "9"
        }
        isLastNumberSymbol = true
    }
    
    @IBAction func ClickDot(_ sender: Any) {
        if isLastNumberSymbol {
            labelNumber.text! += "."
        }
    }
    
    @IBAction func ClickPlus(_ sender: Any) {
        if isLastNumberSymbol {
            labelNumber.text! += "+"
            isLastNumberSymbol = false
            isNumberDisplayed = false
        }
    }
    
    @IBAction func ClickMinus(_ sender: Any) {
        if isLastNumberSymbol {
            labelNumber.text! += "-"
            isLastNumberSymbol = false
            isNumberDisplayed = false
        }
    }
    
    @IBAction func ClickMultiplication(_ sender: Any) {
        if isLastNumberSymbol {
            labelNumber.text! += "*"
            isLastNumberSymbol = false
            isNumberDisplayed = false
        }
    }
    
    @IBAction func ClickDevision(_ sender: Any) {
        if isLastNumberSymbol {
            labelNumber.text! += "/"
            isLastNumberSymbol = false
            isNumberDisplayed = false
        }
    }
    
    @IBAction func ClickPercent(_ sender: Any) {
        if isNumberDisplayed {
            var temp = Double(labelNumber.text!)
            temp = temp!/100
            labelNumber.text = String(temp!)
        }
    }
    
    @IBAction func ClickSign(_ sender: Any) {
        if isNumberDisplayed {
            var temp = Double(labelNumber.text!)
            temp = -1 * temp!
            if isNumberDouble(temp!) {
                labelNumber.text = String(temp!)
            } else {
                var temp2 = String(temp!)
                temp2.remove(at: temp2.index(before: temp2.endIndex))
                temp2.remove(at: temp2.index(before: temp2.endIndex))
                labelNumber.text = String(temp2)
            }
        }
    }
    
    @IBAction func ClickEqual(_ sender: Any) {
        let expression = NSExpression(format: labelNumber.text!)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            if isNumberDouble(result) {
                labelNumber.text = String(result)
            } else {
                var temp = String(result)
                temp.remove(at: temp.index(before: temp.endIndex))
                temp.remove(at: temp.index(before: temp.endIndex))
                labelNumber.text = String(temp)
            }
        }
        isNumberDisplayed = true
        isLastNumberSymbol = true
    }
}

extension Double {
    func decimalCount() -> Int {
        if self == Double(Int(self)) {
            return 0
        }

        let integerString = String(Int(self))
        let doubleString = String(Double(self))
        let decimalCount = doubleString.count - integerString.count - 1

        return decimalCount
    }
}
