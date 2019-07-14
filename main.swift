//
//  main.swift
//  hangman-project-levi
//
//  Created by Levi Davis on 7/12/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

//now my code starts

func playTheGame() {
    //create a function to run
    let targetWord: String = allTheWords.randomElement()! //I'm too tired to use something more elegant!
    var targetWordArray: [String] = []
    var whatToDisplay: [String] = []
    var lettersGuessed: [String] = []
    var counter: Int = 0
    var guesses = 0
    //    set up some variables, target word, something to display, an array to hold guesses and compare to the target, and a counter to keep track and end the game.
    
    for _ in 1...targetWord.count {
        whatToDisplay.append("?")
        //creating an array of "?" to start.
    }
    
    for i in targetWord {
        targetWordArray.append(String(i))
        //creating an array to compare to the display so the game knows when you've won
    }
    
    
    //here is where the game really starts
    
    
    while guesses < 6 && targetWordArray != whatToDisplay {
        //        The loop starts, as long as there are not too many guesses and the guesses to not equal the target
        let userInput = readLine()
        //user input
        if let userInput = userInput {
            lettersGuessed.append(userInput)
            //add guess to array to compare to targetWord
            for i in targetWord {
                
                let stringI = String(i)
                if lettersGuessed.contains(stringI) {
                    whatToDisplay[counter] = stringI
                    //                wasItCorrect = "true"
                    //add correct guess to display at index of counter value
                }
                else {
                    whatToDisplay[counter] = "?"
                    //                wasItCorrect = "false"
                    //show "?" in spaces where letter has not been guessed
                    
                }
                counter += 1
                //increment counter
            }
            print("The word is \(whatToDisplay)")
            print("You have guessed: \(lettersGuessed)")
            //
            //Display
            
        }
        if let userInput = userInput {
            if targetWordArray.contains(userInput) != true {
                guesses += 1
                //increment guesses only if guess is wrong
            }
        }
        
        let guessesLeft = 6 - guesses
        print("Number of guesses left: \(guessesLeft)")
        //Increment guesses counter and show how many left
        if guessesLeft == 5{
            print(" - - - - -\n|        |\n|        O\n")
        } else if guessesLeft == 4 {
            print(" - - - - -\n|        |\n|        O\n|      / |")
        } else if guessesLeft == 3 {
            print(" - - - - -\n|        |\n|        O\n|      / | \\")
        } else if guessesLeft == 2 {
            print(" - - - - -\n|        |\n|        O\n|      / | \\\n|        |")
        } else if guessesLeft == 1 {
            print(" - - - - -\n|        |\n|        O\n|      / | \\\n|        |\n|       /")
        } else if guessesLeft == 0 {
            print(" - - - - -\n|        |\n|        O\n|      / | \\\n|        |\n|       / \\")
        } //pictures
        counter = 0
        //reset array counter before next guess
    }
    if targetWordArray == whatToDisplay {
        for _ in 1...100 {
            print("*!*!*!*!")
        }
        print("You win!")
        print(targetWordArray)
        print("You had \(6 - guesses) guesses left. Do better next time. Your parents are ashamed of you.")
    }
    else {
        print("You lose. The word was \(targetWordArray).")
    }
}

//Greeting to start the game. Probably could have put this inside the other func, but by the time I got around to it, this was easier.
func doYouWantToPlay() {
    print("Do you want to play Hangman? (y/n)")
    let userInput = readLine()
    
    if let userInput = userInput {
        if userInput == "n" {
            print("You lose")
        }
        else if userInput == "y" {
            print("You are playing Hangman! Guess a letter.")
            playTheGame()
        }
        else {
            print("Does not compute")
            
        }
    }
    print("Do you want to play again (y,n)?")
    if userInput == "y" {
        playTheGame()
        //hmm, it takes "y" as the first guess ont he new game, how do I fix that?
    } else {
        print("It's been real.")
        //hmm, even if they say no, the game restarts.
    }
}
doYouWantToPlay()

//" - - - - -\n"+
//"|        |\n"+
//"|        O\n" +
//"|      / | \\ \n"+
//"|        |\n" +
//"|       / \\ \n" +
//"|\n" +
//"|\n";



