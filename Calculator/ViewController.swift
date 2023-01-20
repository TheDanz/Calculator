import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentValueLabel: UILabel!
    
    var savedValue: Double = 0
    var currentOperation: Operation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberClick(_ sender: UIButton) {
        let number = sender.tag
        currentValueLabel.text = currentValueLabel.text! + String(number)
    }
    
    @IBAction func operationClick(_ sender: UIButton) {
        guard let unwrapSavedValue = Double(currentValueLabel.text!) else { return }
        
        savedValue = unwrapSavedValue
        currentValueLabel.text = ""
        
        switch sender.tag {
        case 13:
            currentOperation = .division
        case 14:
            currentOperation = .multiplication
        case 15:
            currentOperation = .subtraction
        case 16:
            currentOperation = .addition
        default:
            break
        }
    }
    
    @IBAction func EqualClick(_ sender: UIButton) {
        guard let currentValue = Double(currentValueLabel.text!) else { return }
        
        switch currentOperation {
        case .addition:
            currentValueLabel.text = String(savedValue + currentValue)
        case .subtraction:
            currentValueLabel.text = String(savedValue - currentValue)
        case .multiplication:
            currentValueLabel.text = String(savedValue * currentValue)
        case .division:
            currentValueLabel.text = String(savedValue / currentValue)
        case .none:
            break
        }
        
        currentOperation = nil
    }
    
    @IBAction func signClick(_ sender: UIButton) {
        guard let unwrapCurrentValue = Double(currentValueLabel.text!) else { return }
        var currentValue = unwrapCurrentValue
        currentValue = -currentValue
        currentValueLabel.text = String(currentValue)
    }
    
    
    @IBAction func percentClick(_ sender: Any) {
        guard let unwrapCurrentValue = Double(currentValueLabel.text!) else { return }
        var currentValue = unwrapCurrentValue
        currentValue /= 100
        currentValueLabel.text = String(currentValue)
    }
    
    @IBAction func clearClick(_ sender: Any) {
        currentValueLabel.text = ""
        currentOperation = nil
        savedValue = 0
    }
    
    @IBAction func commaClick(_ sender: UIButton) {
        if currentValueLabel.text?.last != "." {
            if currentValueLabel.text != "" {
                currentValueLabel.text = currentValueLabel.text! + "."
            } else {
                currentValueLabel.text = currentValueLabel.text! + "0."
            }
        }
    }
}

enum Operation {
    case addition
    case subtraction
    case multiplication
    case division
}
