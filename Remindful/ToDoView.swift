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
        
        let alert = UIAlertController(title: "New Task", message: nil, preferredStyle: .alert)
        
        alert.addTextField {textField in
            textField.placeholder = "New Task"
        }
        
        let addButton = UIAlertAction(title: "Done", style: .default){action in
            guard let text = alert.textFields?.first?.text
            else{
                return
            }
                    let item = Item(text: text, isDone: false)
            
            let newIndexPath = IndexPath(row: self.items.count, section: 0)
            
            self.items.append(item)
            self.tableView.insertRows(at: [newIndexPath], with: .fade)
                   
        }
        
        alert.addAction(addButton)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true)
 
    }
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "taskCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //code here
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
}
