//
//  MockData.swift
//  Recipes
//
//  Created by Carlos on 7/19/24.
//

import Foundation


struct MockData {
    static let meal = Meal(id: "52893", name: "Apple & Blackberry Crumble", imageUrl: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
    
    static let instructions = "Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream."
    
    static let meals = [
        Meal(id: "53049",
             name: "Apam balik",
             imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"
            ),
        Meal(id: "52893",
             name: "Apple & Blackberry Crumble",
             imageUrl: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"
            ),
        Meal(id: "52768",
             name: "Apple Frangipan Tart",
             imageUrl: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"
            ),
        Meal(id: "52767",
             name: "Bakewell tart",
             imageUrl: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg"
            ),
        Meal(id: "52855",
             name: "Banana Pancakes",
             imageUrl: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg"
            ),
        Meal(id: "52894",
             name: "Battenberg Cake",
             imageUrl: "https://www.themealdb.com/images/media/meals/ywwrsp1511720277.jpg"
            ),
        Meal(id: "52928",
             name: "BeaverTails",
             imageUrl: "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg"
            )
    ]
}
