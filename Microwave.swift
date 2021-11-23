//
//  Created by Jonathan Pasco-Arnone
//  Created on 2021-11-19
//  Version 1.0
//  Copyright (c) 2021 MTHS. All rights reserved.
//
//  This program calculates the amount of time to reheat a
//  specific quantity of a specific type of food.

// Variables
var quantity
var quantityMultiplier
var minutes
var seconds

// Constants.
let subTime = 60
let pizzaTime = 45
let soupTime = 105
let seconds = 60

// Making an error case.
enum MyError: Error {
    case invalidInteger(String)
}

func calculatePrice() throws {

    // Variables.
    var quantityMultiplier
    var minutes
    var seconds
    var getQuantityMultiplier = 0.5
    var food = ""
    var quantityDouble = 0
    let maxQuantity = 4

    // Inputs.
    print("Are you heating a sub, pizza, or soup?: ")
    food = readLine()! 

    print("How many ", food, "(s) are you heating?(max:3): ")
    quantity = readLine()

    if let quantityDouble = Double(quantity!) && quantity > 0 && quantity < maxQuantity {

        // Calculations.
        if food == "sub" {
            minutes = floor(subTime * quantityMultiplier / 60)
            seconds = (subTime * quantityMultiplier / 60 - minutes) * 60
        } else if food == "pizza" {
                minutes = floor(pizzaTime * quantityMultiplier / 60)
                seconds = (pizzaTime * quantityMultiplier / 60 - minutes) * 60
        } else if food == "soup" {
                minutes = floor(soupTime * quantityMultiplier / 60)
                seconds = (soupTime * quantityMultiplier / 60 - minutes) * 60
        }

        // Outputs.
        print("\nDone.")

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
