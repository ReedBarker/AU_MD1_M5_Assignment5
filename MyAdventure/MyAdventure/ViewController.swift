
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UI_PreviousUserAction: UILabel!
    @IBOutlet weak var UI_QueryUserAction: UILabel!
    @IBOutlet weak var UI_Option1: UIButton!
    @IBOutlet weak var UI_Option2: UIButton!
    
    var adventureTree = AdventureTree()     // System is based on a binary tree. Each node is a point in the adventure
    
    var currentNode: AdventureNode!         // current node in tree
    
    override func viewDidLoad() {           // initialize tree and set up UI
        super.viewDidLoad()
        
        currentNode = adventureTree.root
        updateUI(with: currentNode)
    }
        
    @IBAction func optionOneSelected(_ sender: UIButton) {
        traverseDownTree(direction: "left")
    }
    
    @IBAction func optionTwoSelected(_ sender: UIButton) {
        traverseDownTree(direction: "right")
    }
    
    func traverseDownTree(direction: String) {
        if direction == "left", let nextNode = currentNode.left {
            currentNode = nextNode
            updateUI(with: currentNode)
        }
        else if direction == "right", let nextNode = currentNode.right {
            currentNode = nextNode
            updateUI(with: currentNode)
        }
        else {                            // End of the branch - show alert
            let alert = UIAlertController(title: "End of Adventure", message: "There are no further choices in this direction.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    // Update the UI with current node details
    func updateUI(with node: AdventureNode) {
        UI_PreviousUserAction.text = node.previousUserAction
        UI_QueryUserAction.text = node.queryUserAction
        UI_Option1.setTitle(node.optionOne, for: .normal)
        UI_Option2.setTitle(node.optionTwo, for: .normal)
    }
}
