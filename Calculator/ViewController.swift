import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelNumber: UILabel!
    var currentNumber: Double = 0
    var tempNumber: Double = 0
    var currentOperation: Character = "n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateLabel() {
        if isNumberDouble(currentNumber) {
            labelNumber.text = "\(currentNumber)"
        } else {
            labelNumber.text = "\(Int(currentNumber))"
        }
    }
    
    func isNumberDouble(_ number: Double) -> Bool {
        if number.decimalCount() == 0 {
            return false
        }
        return true
    }
    
    @IBAction func ClickAC(_ sender: Any) {
        currentNumber = 0
        labelNumber.text = "0"
        currentOperation = "n"
    }
    
    @IBAction func Click0(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "0"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func Click1(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "1"
        } else {
            labelNumber.text = "1"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func Click2(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "2"
        } else {
            labelNumber.text = "2"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func Click3(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "3"
        } else {
            labelNumber.text = "3"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func Click4(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "4"
        } else {
            labelNumber.text = "4"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func Click5(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "5"
        } else {
            labelNumber.text = "5"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func Click6(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "6"
        } else {
            labelNumber.text = "6"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func Click7(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "7"
        } else {
            labelNumber.text = "7"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func Click8(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "8"
        } else {
            labelNumber.text = "8"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func Click9(_ sender: Any) {
        if labelNumber.text != "0" {
            labelNumber.text! += "9"
        } else {
            labelNumber.text = "9"
        }
        currentNumber = Double(labelNumber.text!)!
    }
    
    @IBAction func ClickDot(_ sender: Any) {
        if !isNumberDouble(currentNumber) && labelNumber.text?.last != "." {
            labelNumber.text! += "."
            currentNumber = Double(labelNumber.text!)!
        }
    }
    
    @IBAction func ClickPlus(_ sender: Any) {
        if currentOperation == "n"
        {
            labelNumber.text = "0"
            tempNumber = currentNumber
            currentOperation = "+"
        } else {
            toDoOperation()
            labelNumber.text = "0"
            tempNumber = currentNumber
            currentOperation = "+"
        }
    }
    
    @IBAction func ClickMinus(_ sender: Any) {
        if currentOperation == "n" {
            labelNumber.text = "0"
            tempNumber = currentNumber
            currentOperation = "-"
        } else {
            toDoOperation()
            labelNumber.text = "0"
            tempNumber = currentNumber
            currentOperation = "-"
        }
    }
    
    @IBAction func ClickMultiplication(_ sender: Any) {
        if currentOperation == "n" {
            labelNumber.text = "0"
            tempNumber = currentNumber
            currentOperation = "*"
        } else {
            toDoOperation()
            labelNumber.text = "0"
            tempNumber = currentNumber
            currentOperation = "*"
        }
    }
    
    @IBAction func ClickDevision(_ sender: Any) {
        if currentOperation == "n" {
            labelNumber.text = "0"
            tempNumber = currentNumber
            currentOperation = "/"
        } else {
            toDoOperation()
            labelNumber.text = "0"
            tempNumber = currentNumber
            currentOperation = "/"
        }
    }
    
    @IBAction func ClickPercent(_ sender: Any) {
        currentNumber /= 100
        updateLabel()
    }
    
    @IBAction func ClickSign(_ sender: Any) {
        if currentNumber != 0 {
            currentNumber *= -1
        }
        updateLabel()
    }
    
    func toDoOperation() {
        switch currentOperation {
        case "+":
            currentNumber += tempNumber
            tempNumber = 0
            updateLabel()
            currentOperation = "n"
        case "-":
            currentNumber = tempNumber - currentNumber
            tempNumber = 0
            updateLabel()
            currentOperation = "n"
        case "*":
            currentNumber *= tempNumber
            tempNumber = 0
            updateLabel()
            currentOperation = "n"
        case "/":
            currentNumber = tempNumber / currentNumber
            tempNumber = 0
            updateLabel()
            currentOperation = "n"
        default:
            break
        }
    }
    
    @IBAction func ClickEqual(_ sender: Any) {
        toDoOperation()
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
