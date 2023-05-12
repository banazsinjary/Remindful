import UIKit

struct Habit{
    let text: String
    let days: [Bool]
}


class HabitView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var habits: [Habit]=[
        Habit(text: "yoga practice", days: [false]),
        Habit(text: "run 2 miles", days: [false])
    ]
    
    @IBOutlet weak var habitTable: UITableView!
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Habit", message: nil, preferredStyle: .alert)
        
        alert.addTextField {textField in
            textField.placeholder = "New Habit"
        }
        
        let addButton = UIAlertAction(title: "Done", style: .default){action in
            guard let text = alert.textFields?.first?.text
            else{
                return
            }
                    let habit = Habit(text: text, days: [false])
            
            let newIndexPath = IndexPath(row: self.habits.count, section: 0)
            
            self.habits.append(habit)
            self.habitTable.insertRows(at: [newIndexPath], with: .fade)
                   
        }
        
        alert.addAction(addButton)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        habitTable.dataSource = self
        habitTable.delegate = self
        habitTable.register(UINib(nibName: "HabitCell", bundle: nil), forCellReuseIdentifier: "HabitCell")
        habitTable.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = habitTable.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as! HabitCell
        let habit = habits[indexPath.row]
        cell.habitLabel?.text = habit.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            habits.remove(at: indexPath.row)
            habitTable.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    
}
