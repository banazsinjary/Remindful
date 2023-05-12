import Foundation

struct Item: Codable {
    let text: String
    let isDone: Bool
}

extension Item{
    init?(_ itemEntity: ItemEntity){
        guard
            let text = itemEntity.text
        else{
            return nil
        }
        self = Item(
            text: text,
            isDone: itemEntity.isDone
        )
    }
}
