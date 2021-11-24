//
//  Created by Jonathan Pasco-Arnone
//  Created on 2021-11-19
//  Version 1.0
//  Copyright (c) 2021 MTHS. All rights reserved.
//
//  This program calculates the amount of time to reheat a
//  specific quantity of a specific type of food.

// Variables
var quantityMultiplier: Double

// Constants.
let subTime: Double = 60
let pizzaTime: Double = 45
let soupTime: Double = 105
let secondsInMinute: Double = 60

// Making an error case.
enum MyError: Error {
    case invalidInteger(String)
}

func calculatePrice() throws {

    // Variables.
    var quantityMultiplier: Double
    var minutes: Double
    var seconds: Double
    let getQuantityMultiplier = 0.5
    let maxQuantity = 4

    // Inputs.
    print("Are you heating a sub, pizza, or soup?: ")
    let food = readLine()!

    print("How many ", food, "(s) are you heating?(max:3): ")
    let quantity = readLine()

    if let quantityDouble = Double(quantity!) {
        if Int(quantityDouble) > 0 && Int(quantityDouble) < maxQuantity {
            // Calculations.
            quantityMultiplier = Double((quantityDouble + 1) * getQuantityMultiplier)

            if food == "sub" {
                minutes = Double(Int(subTime * quantityMultiplier / secondsInMinute))
                seconds = (subTime * quantityMultiplier / secondsInMinute - Double(minutes)) * secondsInMinute
            } else if food == "pizza" {
                    minutes = Double(Int(pizzaTime * quantityMultiplier / secondsInMinute))
                    seconds = (pizzaTime * quantityMultiplier / secondsInMinute - Double(minutes)) * secondsInMinute
            } else if food == "soup" {
                    minutes = Double(Int(soupTime * quantityMultiplier / secondsInMinute))
                    seconds = (soupTime * quantityMultiplier / secondsInMinute - Double(minutes)) * secondsInMinute
            } else {
                /* This throws an error out of the called function
                and activates the catch statement.
                */
                throw MyError.invalidInteger("Error")
            }

            // Outputs.
            print("It will take ", minutes, " minutes and ", seconds, " seconds to heat.")
            print("\nDone.")

        } else {
            /* This throws an error out of the called function
            and activates the catch statement.
            */
            throw MyError.invalidInteger("Error")
        }
    } else {

        /* This throws an error out of the called function
        and activates the catch statement.
        */
        throw MyError.invalidInteger("Error")
    }
}

do {
    // Calls the function to be tested for errors.
    try calculatePrice()
} catch {
    print("That was an invalid input")
    print("\nDone.")
}
