import UIKit

struct Item {
    let text: String
    let isDone: Bool
}

class ToDoView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var items: [Item] = [
        Item(text: "wake up at 8am", isDone: false),
        Item(text: "mindfulness", isDone: false)
    ]
    @IBOutlet weak var tableView: UITableView!
    @IBAction func newItemButton(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //code here
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = items[indexPath.row]
        cell.textLabel?.text = item.text
        return cell
        }
    
}
