import SwiftUI

class CandyLevelViewModel: ObservableObject {
    let contact = CandyLevelModel()
    var level = UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 1
    
    func returnText() -> String {
        switch level {
        case 1:
            contact.textArray[0]
        case 2:
            contact.textArray[1]
        case 3:
            contact.textArray[2]
        case 4:
            contact.textArray[3]
        case 5:
            contact.textArray[4]
        case 6:
            contact.textArray[5]
        case 7:
            contact.textArray[6]
        case 8:
            contact.textArray[7]
        case 9:
            contact.textArray[8]
        case 10:
            contact.textArray[9]
        case 11:
            contact.textArray[10]
        case 12:
            contact.textArray[11]
        default:
            contact.textArray[11]
        }
    }
    
    func returnImage() -> String {
        switch level {
        case 1:
            contact.imageArray[0]
        case 2:
            contact.imageArray[1]
        case 3:
            contact.imageArray[2]
        case 4:
            contact.imageArray[3]
        case 5:
            contact.imageArray[4]
        case 6:
            contact.imageArray[5]
        case 7:
            contact.imageArray[6]
        case 8:
            contact.imageArray[7]
        case 9:
            contact.imageArray[8]
        case 10:
            contact.imageArray[9]
        case 11:
            contact.imageArray[10]
        case 12:
            contact.imageArray[11]
        default:
            contact.imageArray[11]
        }
    }
}
