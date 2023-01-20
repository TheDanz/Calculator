import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    var savedValue: Double = 0
    var currentOperation: Operation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberClick(_ sender: UIButton) {
        currentNumberLabel.text = currentNumberLabel.text! + String(sender.tag)
    }
    
    @IBAction func operationClick(_ sender: UIButton) {
        guard let unwrapSavedValue = Double(currentNumberLabel.text!) else { return }
        
        savedValue = unwrapSavedValue
        currentNumberLabel.text = ""
        
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
        guard let currentValue = Double(currentNumberLabel.text!) else { return }
        
        switch currentOperation {
        case .addition:
            currentNumberLabel.text = String(savedValue + currentValue)
        case .subtraction:
            currentNumberLabel.text = String(savedValue - currentValue)
        case .multiplication:
            currentNumberLabel.text = String(savedValue * currentValue)
        case .division:
            currentNumberLabel.text = String(savedValue / currentValue)
        case .none:
            break
        }
        
        currentOperation = nil
    }
    
    @IBAction func signClick(_ sender: UIButton) {
        guard let unwrapCurrentValue = Double(currentNumberLabel.text!) else { return }
        var currentValue = unwrapCurrentValue
        currentValue = -currentValue
        currentNumberLabel.text = String(currentValue)
    }
    
    
    @IBAction func percentClick(_ sender: Any) {
        guard let unwrapCurrentValue = Double(currentNumberLabel.text!) else { return }
        var currentValue = unwrapCurrentValue
        currentValue /= 100
        currentNumberLabel.text = String(currentValue)
    }
    
    @IBAction func clearClick(_ sender: Any) {
        currentNumberLabel.text = ""
        currentOperation = nil
        savedValue = 0
    }
    
    @IBAction func commaClick(_ sender: UIButton) {
        if currentNumberLabel.text?.last != "." {
            if currentNumberLabel.text != "" {
                currentNumberLabel.text = currentNumberLabel.text! + "."
            } else {
                currentNumberLabel.text = currentNumberLabel.text! + "0."
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
