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
    
    
    override func viewDidLoad() {
        habitTable.dataSource = self
        habitTable.delegate = self
        habitTable.register(UINib(nibName: "HabitCell", bundle: nil), forCellReuseIdentifier: "HabitCell")
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
