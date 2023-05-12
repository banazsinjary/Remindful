import Foundation
import CoreData

protocol ItemStore{
    func fetchItem() -> [Item]
    func save(item: Item)
    func delete(item: Item)
    func update(item: Item)
}

struct CoreDataItemsStore: ItemStore {
    
    private static var presistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Core")
        container.loadPersistentStores{_, error in
            if let error = error {
                
            }
        }
        return container
    }()
    
    func fetchItem() -> [Item] {
        let managedContext = CoreDataItemsStore.presistentContainer.viewContext
        
        let fetchRequest = ItemEntity.fetchRequest()
        
        do {
            let itemEntities: [ItemEntity] = try managedContext.fetch(fetchRequest)
            return itemEntities.compactMap{ Item($0) }
        }catch{
            return []
        }
    }
    
    func save(item: Item) {
        let managedContext = CoreDataItemsStore.presistentContainer.viewContext
        
        let itemEntity = ItemEntity(context: managedContext)
        itemEntity.text = item.text
        itemEntity.isDone = item.isDone
        
        do {
            try managedContext.save()
        }catch{
            
        }
        
    }
    
    func delete(item: Item) {
        let managedContext = CoreDataItemsStore.presistentContainer.viewContext
        let fetchRequest = ItemEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "text == %@", item.text as NSString)
        do{
            guard let itemEntity = try managedContext.fetch(fetchRequest).first else{
                return
            }
            managedContext.delete(itemEntity)
            try managedContext.save()
        }catch{
            print("Error deleting item")
        }
        
    }
    
    func update(item: Item) {
        
        let managedContext = CoreDataItemsStore.presistentContainer.viewContext
        let fetchRequest = ItemEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "text == %@", item.text as NSString)
        do{
            guard let itemEntity = try managedContext.fetch(fetchRequest).first else{
                return
            }
            itemEntity.text = item.text
            itemEntity.isDone = item.isDone
            try managedContext.save()
        }catch{

        }

        
    }
    
    
}
