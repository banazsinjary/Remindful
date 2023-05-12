import Foundation

struct Habit{
    let text: String
    let days: Bool
}

extension Habit: Codable{
    init?(_ habitEntity: HabitEntity){
        guard
            let text = habitEntity.text
        else{
            return nil
        }
        self = Habit(
            text: text,
            days:habitEntity.days )
    }
}
