import SwiftUI

enum Keys: String {
    case lifes = "lifes"
    case currentLevel = "currentLevel"
    case backgroundVolume = "backgroundVolume"
    case money = "money"
    case timeCount = "timeCount"
    case stepCount = "stepCount"
    case firstItems = "firstItems"
    case collectionItem = "collectionItem"
    case collectionItem2 = "collectionItem2"
}

class UserDefaultsManager: ObservableObject {
    static let defaults = UserDefaults.standard
    @Published var collectionItem: [Recipe] = []
    @Published var collectionItem2: [Recipe] = []
    
    init() {
        loadCollectionItems()
    }
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) == nil {
            UserDefaultsManager.defaults.set(1,  forKey: Keys.currentLevel.rawValue)
            UserDefaultsManager.defaults.set(5,  forKey: Keys.lifes.rawValue)
            UserDefaultsManager.defaults.set(5,  forKey: Keys.timeCount.rawValue)
            UserDefaultsManager.defaults.set(5,  forKey: Keys.stepCount.rawValue)
            UserDefaultsManager.defaults.set(100,  forKey: Keys.money.rawValue)
            UserDefaultsManager.defaults.set(0.5, forKey: Keys.backgroundVolume.rawValue)
            
            collectionItem = [
                Recipe(image: CandyImageName.collectionItem1.rawValue,
                       closeImage: CandyImageName.collectionItemClose1.rawValue,
                       isOpen: false,
                       desc: "Begin by dissolving strawberry jelly in boiling water, then add cold water and stir well. Pour this mixture into a cake pan and refrigerate until it sets firmly. Once set, repeat the process with orange jelly, gently pouring it over the strawberry layer to avoid mixing. Chill until the orange layer is set. Continue this process with lemon, lime, blueberry, and finally grape jelly, ensuring each layer is fully set before adding the next. After the final layer, chill the entire cake thoroughly. Slice and serve this vibrant dessert, perfect for any celebration."),
                Recipe(image: CandyImageName.collectionItem2.rawValue, closeImage: CandyImageName.collectionItemClose2.rawValue, isOpen: false, desc: "Start by preparing a pie crust and baking it until golden. For the filling, blend lemon juice, zest, sugar, and eggs, cooking over medium heat until the mixture thickens. Pour this into the baked pie crust. For the meringue, whip egg whites with sugar until stiff peaks form, then spread this over the lemon filling. Bake at 350°F (175°C) until the meringue is golden brown. Let it cool before serving."),
                Recipe(image: CandyImageName.collectionItem3.rawValue, closeImage: CandyImageName.collectionItemClose3.rawValue, isOpen: false, desc: "Peel and slice apples, then toss them with sugar and cinnamon. Place the apple mixture in a baking dish. In a separate bowl, combine oats, flour, brown sugar, and butter to create a crumbly topping. Sprinkle this over the apples and bake at 375°F (190°C) until the topping is golden and the apples are tender. Serve warm with a scoop of vanilla ice cream."),
                Recipe(image: CandyImageName.collectionItem4.rawValue, closeImage: CandyImageName.collectionItemClose4.rawValue, isOpen: false, desc: "Mash ripe bananas and mix with sugar, eggs, flour, and baking soda. Pour the batter into a loaf pan and bake at 350°F (175°C) for about 50 minutes, or until a toothpick inserted comes out clean. Allow the bread to cool before slicing. Enjoy this moist and flavorful treat for breakfast or as a snack."),
                Recipe(image: CandyImageName.collectionItem5.rawValue, closeImage: CandyImageName.collectionItemClose5.rawValue, isOpen: false, desc: "Blend cream cheese, sugar, eggs, and vanilla extract until smooth. Pour this mixture into a graham cracker crust and bake at 325°F (165°C) for about an hour, or until the center is almost set. Allow the cheesecake to cool completely, then refrigerate overnight. Serve chilled with a fruit topping if desired."),
                Recipe(image: CandyImageName.collectionItem6.rawValue, closeImage: CandyImageName.collectionItemClose6.rawValue, isOpen: false, desc: "Mix grated carrots with flour, sugar, eggs, oil, and spices like cinnamon and nutmeg. Pour the batter into a cake pan and bake at 350°F (175°C) for about 30 minutes. Once cooled, frost with a cream cheese frosting made from cream cheese, butter, powdered sugar, and vanilla. This cake is perfect for any occasion.")]
            
            collectionItem2 = [
                Recipe(image: CandyImageName.collectionItem7.rawValue, closeImage: CandyImageName.collectionItemClose7.rawValue, isOpen: false, desc: "Dip ladyfingers in coffee mixed with a bit of rum or brandy, then layer them in a dish with a creamy mixture of mascarpone cheese, sugar, and eggs. Dust the top with cocoa powder and refrigerate for several hours to allow the flavors to meld. Serve chilled for a delightful Italian dessert."),
                Recipe(image: CandyImageName.collectionItem8.rawValue, closeImage: CandyImageName.collectionItemClose8.rawValue, isOpen: false, desc: "Chop a variety of fresh fruits such as strawberries, pineapple, grapes, and kiwi. Mix them gently with a light syrup made from a bit of sugar and lemon juice. Serve chilled for a refreshing and healthy dessert option.Chop a variety of fresh fruits such as strawberries, pineapple, grapes, and kiwi. Mix them gently with a light syrup made from a bit of sugar and lemon juice. Serve chilled for a refreshing and healthy dessert option."),
                Recipe(image: CandyImageName.collectionItem9.rawValue, closeImage: CandyImageName.collectionItemClose9.rawValue, isOpen: false, desc: "Blend pumpkin puree with sugar, eggs, and spices like cinnamon, ginger, and cloves. Pour this mixture into a pie crust and bake at 425°F (220°C) for 15 minutes, then reduce the heat to 350°F (175°C) and bake for an additional 40 minutes. Let the pie cool before serving with whipped cream."),
                Recipe(image: CandyImageName.collectionItem10.rawValue, closeImage: CandyImageName.collectionItemClose10.rawValue, isOpen: false, desc: "Bake or purchase shortcake biscuits. Slice them in half and layer with fresh strawberries that have been macerated in sugar, and a generous dollop of whipped cream. Serve immediately for a delightful summer dessert."),
                Recipe(image: CandyImageName.collectionItem11.rawValue, closeImage: CandyImageName.collectionItemClose11.rawValue, isOpen: false, desc: "Mix shredded coconut with sweetened condensed milk, vanilla extract, and a pinch of salt. Drop spoonfuls onto a baking sheet lined with parchment paper and bake at 325°F (165°C) until golden. Let them cool before serving these chewy, coconutty treats."),
                Recipe(image: CandyImageName.collectionItem12.rawValue, closeImage: CandyImageName.collectionItemClose12.rawValue, isOpen: false, desc: "Mix flour, sugar, baking powder, eggs, milk, and fresh blueberries. Spoon the batter into muffin tins and bake at 400°F (200°C) for about 20 minutes, or until a toothpick inserted comes out clean. Enjoy these fruity muffins for breakfast or as a snack.")
            ]
            
            saveCollectionItems()
        }
    }
    
    func resetAll() {
        UserDefaultsManager.defaults.set(1,  forKey: Keys.currentLevel.rawValue)
        UserDefaultsManager.defaults.set(5,  forKey: Keys.lifes.rawValue)
        UserDefaultsManager.defaults.set(5,  forKey: Keys.timeCount.rawValue)
        UserDefaultsManager.defaults.set(5,  forKey: Keys.stepCount.rawValue)
        UserDefaultsManager.defaults.set(100,  forKey: Keys.money.rawValue)
        UserDefaultsManager.defaults.set(0.5, forKey: Keys.backgroundVolume.rawValue)
        
        collectionItem = [
            Recipe(image: CandyImageName.collectionItem1.rawValue,
                   closeImage: CandyImageName.collectionItemClose1.rawValue,
                   isOpen: false,
                   desc: "Begin by dissolving strawberry jelly in boiling water, then add cold water and stir well. Pour this mixture into a cake pan and refrigerate until it sets firmly. Once set, repeat the process with orange jelly, gently pouring it over the strawberry layer to avoid mixing. Chill until the orange layer is set. Continue this process with lemon, lime, blueberry, and finally grape jelly, ensuring each layer is fully set before adding the next. After the final layer, chill the entire cake thoroughly. Slice and serve this vibrant dessert, perfect for any celebration."),
            Recipe(image: CandyImageName.collectionItem2.rawValue, closeImage: CandyImageName.collectionItemClose2.rawValue, isOpen: false, desc: "Start by preparing a pie crust and baking it until golden. For the filling, blend lemon juice, zest, sugar, and eggs, cooking over medium heat until the mixture thickens. Pour this into the baked pie crust. For the meringue, whip egg whites with sugar until stiff peaks form, then spread this over the lemon filling. Bake at 350°F (175°C) until the meringue is golden brown. Let it cool before serving."),
            Recipe(image: CandyImageName.collectionItem3.rawValue, closeImage: CandyImageName.collectionItemClose3.rawValue, isOpen: false, desc: "Peel and slice apples, then toss them with sugar and cinnamon. Place the apple mixture in a baking dish. In a separate bowl, combine oats, flour, brown sugar, and butter to create a crumbly topping. Sprinkle this over the apples and bake at 375°F (190°C) until the topping is golden and the apples are tender. Serve warm with a scoop of vanilla ice cream."),
            Recipe(image: CandyImageName.collectionItem4.rawValue, closeImage: CandyImageName.collectionItemClose4.rawValue, isOpen: false, desc: "Mash ripe bananas and mix with sugar, eggs, flour, and baking soda. Pour the batter into a loaf pan and bake at 350°F (175°C) for about 50 minutes, or until a toothpick inserted comes out clean. Allow the bread to cool before slicing. Enjoy this moist and flavorful treat for breakfast or as a snack."),
            Recipe(image: CandyImageName.collectionItem5.rawValue, closeImage: CandyImageName.collectionItemClose5.rawValue, isOpen: false, desc: "Blend cream cheese, sugar, eggs, and vanilla extract until smooth. Pour this mixture into a graham cracker crust and bake at 325°F (165°C) for about an hour, or until the center is almost set. Allow the cheesecake to cool completely, then refrigerate overnight. Serve chilled with a fruit topping if desired."),
            Recipe(image: CandyImageName.collectionItem6.rawValue, closeImage: CandyImageName.collectionItemClose6.rawValue, isOpen: false, desc: "Mix grated carrots with flour, sugar, eggs, oil, and spices like cinnamon and nutmeg. Pour the batter into a cake pan and bake at 350°F (175°C) for about 30 minutes. Once cooled, frost with a cream cheese frosting made from cream cheese, butter, powdered sugar, and vanilla. This cake is perfect for any occasion.")]
        
        collectionItem2 = [
            Recipe(image: CandyImageName.collectionItem7.rawValue, closeImage: CandyImageName.collectionItemClose7.rawValue, isOpen: false, desc: "Dip ladyfingers in coffee mixed with a bit of rum or brandy, then layer them in a dish with a creamy mixture of mascarpone cheese, sugar, and eggs. Dust the top with cocoa powder and refrigerate for several hours to allow the flavors to meld. Serve chilled for a delightful Italian dessert."),
            Recipe(image: CandyImageName.collectionItem8.rawValue, closeImage: CandyImageName.collectionItemClose8.rawValue, isOpen: false, desc: "Chop a variety of fresh fruits such as strawberries, pineapple, grapes, and kiwi. Mix them gently with a light syrup made from a bit of sugar and lemon juice. Serve chilled for a refreshing and healthy dessert option.Chop a variety of fresh fruits such as strawberries, pineapple, grapes, and kiwi. Mix them gently with a light syrup made from a bit of sugar and lemon juice. Serve chilled for a refreshing and healthy dessert option."),
            Recipe(image: CandyImageName.collectionItem9.rawValue, closeImage: CandyImageName.collectionItemClose9.rawValue, isOpen: false, desc: "Blend pumpkin puree with sugar, eggs, and spices like cinnamon, ginger, and cloves. Pour this mixture into a pie crust and bake at 425°F (220°C) for 15 minutes, then reduce the heat to 350°F (175°C) and bake for an additional 40 minutes. Let the pie cool before serving with whipped cream."),
            Recipe(image: CandyImageName.collectionItem10.rawValue, closeImage: CandyImageName.collectionItemClose10.rawValue, isOpen: false, desc: "Bake or purchase shortcake biscuits. Slice them in half and layer with fresh strawberries that have been macerated in sugar, and a generous dollop of whipped cream. Serve immediately for a delightful summer dessert."),
            Recipe(image: CandyImageName.collectionItem11.rawValue, closeImage: CandyImageName.collectionItemClose11.rawValue, isOpen: false, desc: "Mix shredded coconut with sweetened condensed milk, vanilla extract, and a pinch of salt. Drop spoonfuls onto a baking sheet lined with parchment paper and bake at 325°F (165°C) until golden. Let them cool before serving these chewy, coconutty treats."),
            Recipe(image: CandyImageName.collectionItem12.rawValue, closeImage: CandyImageName.collectionItemClose12.rawValue, isOpen: false, desc: "Mix flour, sugar, baking powder, eggs, milk, and fresh blueberries. Spoon the batter into muffin tins and bake at 400°F (200°C) for about 20 minutes, or until a toothpick inserted comes out clean. Enjoy these fruity muffins for breakfast or as a snack.")
        ]
        
        saveCollectionItems()
    }
    
    func completeLevel() {
        let lifes = UserDefaultsManager.defaults.object(forKey: Keys.lifes.rawValue) as? Int ?? 1
        let money = UserDefaultsManager.defaults.object(forKey: Keys.money.rawValue) as? Int ?? 1
        let currentLevel = UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 1
        if currentLevel <= 11 {
            UserDefaultsManager.defaults.set(currentLevel + 1,  forKey: Keys.currentLevel.rawValue)
            UserDefaultsManager.defaults.set(lifes + 1,  forKey: Keys.lifes.rawValue)
            UserDefaultsManager.defaults.set(money + 30,  forKey: Keys.money.rawValue)
        }
        
        
    }
    
    func loseLevel() {
        let lifes = UserDefaultsManager.defaults.object(forKey: Keys.lifes.rawValue) as? Int ?? 1
        if lifes >= 1 {
            UserDefaultsManager.defaults.set(lifes - 1,  forKey: Keys.lifes.rawValue)
        }
    }
    
    func buyLifes() {
        let lifes = UserDefaultsManager.defaults.object(forKey: Keys.lifes.rawValue) as? Int ?? 1
        let money = UserDefaultsManager.defaults.object(forKey: Keys.money.rawValue) as? Int ?? 1
        
        if money >= 30 {
            UserDefaultsManager.defaults.set(lifes + 1,  forKey: Keys.lifes.rawValue)
            UserDefaultsManager.defaults.set(money - 30,  forKey: Keys.money.rawValue)
        }
    }
    
    func buyTime() {
        let time = UserDefaultsManager.defaults.object(forKey: Keys.timeCount.rawValue) as? Int ?? 1
        let money = UserDefaultsManager.defaults.object(forKey: Keys.money.rawValue) as? Int ?? 1
        
        if money >= 30 {
            UserDefaultsManager.defaults.set(time + 1,  forKey: Keys.timeCount.rawValue)
            UserDefaultsManager.defaults.set(money - 30,  forKey: Keys.money.rawValue)
        }
    }
    
    func buyStep() {
        let step = UserDefaultsManager.defaults.object(forKey: Keys.stepCount.rawValue) as? Int ?? 1
        let money = UserDefaultsManager.defaults.object(forKey: Keys.money.rawValue) as? Int ?? 1
        
        if money >= 30 {
            UserDefaultsManager.defaults.set(step + 1,  forKey: Keys.stepCount.rawValue)
            UserDefaultsManager.defaults.set(money - 30,  forKey: Keys.money.rawValue)
        }
    }
    
    func saveVolumeSettings(backgroundVolume: Float) {
        UserDefaultsManager.defaults.set(backgroundVolume, forKey: Keys.backgroundVolume.rawValue)
    }
    
    func loadVolumeSettings() -> Float {
        var backgroundVolume = UserDefaultsManager.defaults.float(forKey: Keys.backgroundVolume.rawValue)
        if backgroundVolume == 0.0 {
            backgroundVolume = 1.0
        }
        return backgroundVolume
    }
    
    func saveCollectionItems() {
        if let encoded = try? JSONEncoder().encode(collectionItem) {
            UserDefaults.standard.set(encoded, forKey: Keys.collectionItem.rawValue)
        }
        if let encoded = try? JSONEncoder().encode(collectionItem2) {
            UserDefaults.standard.set(encoded, forKey: Keys.collectionItem2.rawValue)
        }
        objectWillChange.send()
    }
    
    func loadCollectionItems() {
        if let savedItems = UserDefaults.standard.data(forKey: Keys.collectionItem.rawValue),
           let decodedItems = try? JSONDecoder().decode([Recipe].self, from: savedItems) {
            collectionItem = decodedItems
        } else {
            collectionItem = [
                Recipe(image: CandyImageName.collectionItem1.rawValue,
                       closeImage: CandyImageName.collectionItemClose1.rawValue,
                       isOpen: false,
                       desc: "Begin by dissolving strawberry jelly in boiling water, then add cold water and stir well. Pour this mixture into a cake pan and refrigerate until it sets firmly. Once set, repeat the process with orange jelly, gently pouring it over the strawberry layer to avoid mixing. Chill until the orange layer is set. Continue this process with lemon, lime, blueberry, and finally grape jelly, ensuring each layer is fully set before adding the next. After the final layer, chill the entire cake thoroughly. Slice and serve this vibrant dessert, perfect for any celebration."),
                Recipe(image: CandyImageName.collectionItem2.rawValue, closeImage: CandyImageName.collectionItemClose2.rawValue, isOpen: false, desc: "Start by preparing a pie crust and baking it until golden. For the filling, blend lemon juice, zest, sugar, and eggs, cooking over medium heat until the mixture thickens. Pour this into the baked pie crust. For the meringue, whip egg whites with sugar until stiff peaks form, then spread this over the lemon filling. Bake at 350°F (175°C) until the meringue is golden brown. Let it cool before serving."),
                Recipe(image: CandyImageName.collectionItem3.rawValue, closeImage: CandyImageName.collectionItemClose3.rawValue, isOpen: false, desc: "Peel and slice apples, then toss them with sugar and cinnamon. Place the apple mixture in a baking dish. In a separate bowl, combine oats, flour, brown sugar, and butter to create a crumbly topping. Sprinkle this over the apples and bake at 375°F (190°C) until the topping is golden and the apples are tender. Serve warm with a scoop of vanilla ice cream."),
                Recipe(image: CandyImageName.collectionItem4.rawValue, closeImage: CandyImageName.collectionItemClose4.rawValue, isOpen: false, desc: "Mash ripe bananas and mix with sugar, eggs, flour, and baking soda. Pour the batter into a loaf pan and bake at 350°F (175°C) for about 50 minutes, or until a toothpick inserted comes out clean. Allow the bread to cool before slicing. Enjoy this moist and flavorful treat for breakfast or as a snack."),
                Recipe(image: CandyImageName.collectionItem5.rawValue, closeImage: CandyImageName.collectionItemClose5.rawValue, isOpen: false, desc: "Blend cream cheese, sugar, eggs, and vanilla extract until smooth. Pour this mixture into a graham cracker crust and bake at 325°F (165°C) for about an hour, or until the center is almost set. Allow the cheesecake to cool completely, then refrigerate overnight. Serve chilled with a fruit topping if desired."),
                Recipe(image: CandyImageName.collectionItem6.rawValue, closeImage: CandyImageName.collectionItemClose6.rawValue, isOpen: false, desc: "Mix grated carrots with flour, sugar, eggs, oil, and spices like cinnamon and nutmeg. Pour the batter into a cake pan and bake at 350°F (175°C) for about 30 minutes. Once cooled, frost with a cream cheese frosting made from cream cheese, butter, powdered sugar, and vanilla. This cake is perfect for any occasion.")
            ]
        }
        if let savedItems = UserDefaults.standard.data(forKey: Keys.collectionItem2.rawValue),
           let decodedItems = try? JSONDecoder().decode([Recipe].self, from: savedItems) {
            collectionItem2 = decodedItems
        } else {
            collectionItem2 = [
                Recipe(image: CandyImageName.collectionItem7.rawValue, closeImage: CandyImageName.collectionItemClose7.rawValue, isOpen: false, desc: "Dip ladyfingers in coffee mixed with a bit of rum or brandy, then layer them in a dish with a creamy mixture of mascarpone cheese, sugar, and eggs. Dust the top with cocoa powder and refrigerate for several hours to allow the flavors to meld. Serve chilled for a delightful Italian dessert."),
                Recipe(image: CandyImageName.collectionItem8.rawValue, closeImage: CandyImageName.collectionItemClose8.rawValue, isOpen: false, desc: "Chop a variety of fresh fruits such as strawberries, pineapple, grapes, and kiwi. Mix them gently with a light syrup made from a bit of sugar and lemon juice. Serve chilled for a refreshing and healthy dessert option.Chop a variety of fresh fruits such as strawberries, pineapple, grapes, and kiwi. Mix them gently with a light syrup made from a bit of sugar and lemon juice. Serve chilled for a refreshing and healthy dessert option."),
                Recipe(image: CandyImageName.collectionItem9.rawValue, closeImage: CandyImageName.collectionItemClose9.rawValue, isOpen: false, desc: "Blend pumpkin puree with sugar, eggs, and spices like cinnamon, ginger, and cloves. Pour this mixture into a pie crust and bake at 425°F (220°C) for 15 minutes, then reduce the heat to 350°F (175°C) and bake for an additional 40 minutes. Let the pie cool before serving with whipped cream."),
                Recipe(image: CandyImageName.collectionItem10.rawValue, closeImage: CandyImageName.collectionItemClose10.rawValue, isOpen: false, desc: "Bake or purchase shortcake biscuits. Slice them in half and layer with fresh strawberries that have been macerated in sugar, and a generous dollop of whipped cream. Serve immediately for a delightful summer dessert."),
                Recipe(image: CandyImageName.collectionItem11.rawValue, closeImage: CandyImageName.collectionItemClose11.rawValue, isOpen: false, desc: "Mix shredded coconut with sweetened condensed milk, vanilla extract, and a pinch of salt. Drop spoonfuls onto a baking sheet lined with parchment paper and bake at 325°F (165°C) until golden. Let them cool before serving these chewy, coconutty treats."),
                Recipe(image: CandyImageName.collectionItem12.rawValue, closeImage: CandyImageName.collectionItemClose12.rawValue, isOpen: false, desc: "Mix flour, sugar, baking powder, eggs, milk, and fresh blueberries. Spoon the batter into muffin tins and bake at 400°F (200°C) for about 20 minutes, or until a toothpick inserted comes out clean. Enjoy these fruity muffins for breakfast or as a snack.")
            ]
        }
        objectWillChange.send()
    }
    
    func getRandomAndOpenItem() -> Recipe? {
        let allItemsInCollection1Open = collectionItem.allSatisfy { $0.isOpen }
        let allItemsInCollection2Open = collectionItem2.allSatisfy { $0.isOpen }
        if allItemsInCollection1Open && allItemsInCollection2Open {
            return nil
        }
        let selectedArray: [Recipe]
        var selectedArrayIndex: Int
        
        if !allItemsInCollection1Open {
            selectedArray = collectionItem
            selectedArrayIndex = 0
        } else {
            selectedArray = collectionItem2
            selectedArrayIndex = 1
        }
        
        let closedItemsIndices = selectedArray.indices.filter { !selectedArray[$0].isOpen }
        guard let randomIndex = closedItemsIndices.randomElement() else {
            return nil
        }
        
        var selectedItem = selectedArray[randomIndex]
        selectedItem.isOpen = true
        
        if selectedArrayIndex == 0 {
            collectionItem[randomIndex] = selectedItem
        } else {
            collectionItem2[randomIndex] = selectedItem
        }
        
        saveCollectionItems()
        
        return selectedItem
    }
}

