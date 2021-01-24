import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let warVC = segue.destination as! warViewController
        warVC.firstPlayerName = firstPlayerNamed
        warVC.secondPlayerName = secondPlayerNamed
    }
    
    @IBOutlet var firstPlayerName: UITextField!
    var firstPlayerNamed: String = ""
    @IBOutlet var secondPlayerName: UITextField!
    var secondPlayerNamed: String = ""
    
    @IBAction func startPressed(_ sender: UIButton) {
        if firstPlayerName.text?.isEmpty == true || secondPlayerName.text?.isEmpty == true {
            let alert = UIAlertController(title: "Error", message: "Please write a name.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
                action in switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    print("cancel")
                case .destructive:
                    print("destrucive")
                @unknown default:
                    fatalError()
                }
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
        firstPlayerNamed = firstPlayerName.text!
        secondPlayerNamed = secondPlayerName.text!
        performSegue(withIdentifier: "goToWar", sender: nil)
        }
    }
}

