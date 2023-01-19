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
        savedValue = Double(currentNumberLabel.text!)!
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
        let currentValue = Double(currentNumberLabel.text!)!
        
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
}

enum Operation {
    case addition
    case subtraction
    case multiplication
    case division
}
