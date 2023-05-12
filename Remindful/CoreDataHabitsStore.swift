import Foundation
import CoreData

protocol HabitStore{
    func fetchItem() -> [Habit]
    func save(habit: Habit)
    func delete(habit: Habit)
    func update(habit: Habit)
}

struct CoreDataHabitsStore: HabitStore {
    
    private static var presistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Core")
        container.loadPersistentStores{_, error in
            if let error = error {
                
            }
        }
        return container
    }()
    
    func fetchItem() -> [Habit] {
        let managedContext = CoreDataHabitsStore.presistentContainer.viewContext
        
        let fetchRequest = HabitEntity.fetchRequest()
        
        do {
            let habitEntities: [HabitEntity] = try managedContext.fetch(fetchRequest)
            return habitEntities.compactMap{ Habit($0) }
        }catch{
            return []
        }
    }
    
    func save(habit: Habit) {
        let managedContext = CoreDataHabitsStore.presistentContainer.viewContext
        
        let habitEntity = HabitEntity(context: managedContext)
        habitEntity.text = habit.text
        habitEntity.days = habit.days
        
        do {
            try managedContext.save()
        }catch{
            
        }
    }
    
    func delete(habit: Habit) {
        let managedContext = CoreDataHabitsStore.presistentContainer.viewContext
        let fetchRequest = HabitEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "text == %@", habit.text as NSString)
        do{
            guard let habitEntity = try managedContext.fetch(fetchRequest).first else{
                return
            }
            managedContext.delete(habitEntity)
            try managedContext.save()
        }catch{
            
        }
    }
    
    func update(habit: Habit) {
        let managedContext = CoreDataHabitsStore.presistentContainer.viewContext
        let fetchRequest = HabitEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "text == %@", habit.text as NSString)
        do{
            guard let habitEntity = try managedContext.fetch(fetchRequest).first else{
                return
            }
            habitEntity.text = habit.text
            habitEntity.days = habit.days
            try managedContext.save()
        }catch{
            print("Error deleting item")
        }
    }
    
    
}

