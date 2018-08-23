//
//  main.swift
//  Guessing Game
//
//  Created by Caleb Ogles on 8/20/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import Foundation

//Variable that determines whether or not we're still playing the game
var playingGame = true

//This loop will run while we're playing the game
repeat {
    //This is the random number that we generated. We cast it from UInt32 to an Int
    
    let randomNumber = Int(arc4random_uniform(101))
    
    //Printing out the random number of debugging
    print("Random Number: \(randomNumber)")
    
    //This is the number of guesses a user has to get it right
    var numberOfGuesses = 5
    
    //Welcome the user and prompt them for input
    print("Welcome to the Guessing Game!")
    print("Please guess a number between 0 to 100.")
    var userGuess = Int(readLine()!)
    
    //If the user enters a value that can't be converted to an integer, userGuess will equal nil.
    
    //Input Validation
    while userGuess == nil {
        //Prompt the user for
        print("Please enter a valid number")
        //Get user input again
        userGuess = Int(readLine()!)
        
    }
    
    
    //Make another if statement that says if the user's guess is not equal to the random number, print out whether the guess is too high or too low
    if userGuess != randomNumber {
        //While the user hasn't guessed the random number and still has guesses remaining
        while userGuess! != randomNumber && numberOfGuesses > 1 {
            //Remove a guess from the user's remaining guesses
            numberOfGuesses -= 1
            //Tell user how many tries they have remaining
            print("You have \(numberOfGuesses) tries remaining.")
            
            if userGuess! > randomNumber {
                print("You guessed too high.")
            } else if userGuess! < randomNumber {
                print("You guessed too low.")
            }
            
            userGuess = Int(readLine()!)
            
            while userGuess == nil {
                //Prompt the user for
                print("Please enter a valid number")
                //Get user input again
                userGuess = Int(readLine()!)
            }
        }
    }
    
    //Check to see if the user is out of guesses and hasn't guessed the correct number.
    if numberOfGuesses == 1 && userGuess != randomNumber {
        //Tell the user they're out of tries, and prompt them on if they want to play again or not.
        print("Game Over")
        print("You ran out of tries. The correct answer was \(randomNumber)")
        print("Would you like to play again? Y/N")
        var stillPlaying = readLine()!.uppercased()
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Would you like to play again? Y/N")
            stillPlaying = readLine()!
        }
        
        if stillPlaying == "N" {
            playingGame = false
        }
        
        if stillPlaying == "Y" {
            playingGame = true
        }
        
    }
    
    
    
    if userGuess == randomNumber {
        print("You guessed the number")
        playingGame = false
        
    }; if userGuess == randomNumber {
        //Tell the user they won and ask them if they want to play again
        print("You win!")
        print("Would you like to play again? Y/N")
        
        //Get user input to check
        var stillPlaying = readLine()!.uppercased()
        //If they HAVEN'T entered a Y or an N, keep asking them for input until they do
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Would you like to play again? Y/N")
            stillPlaying = readLine()!
        }
        
        //If they entered an N, set playingGame to false (which will end the game)
        if stillPlaying == "N" {
            playingGame = false
            
        }
        
        if stillPlaying == "Y" {
            playingGame = true
        }
        
    }
    
} while playingGame == true

