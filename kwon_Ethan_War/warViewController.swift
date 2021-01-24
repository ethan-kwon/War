import UIKit
class warViewController: UIViewController {
    var firstPlayerName: String = ""
    var secondPlayerName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Gets the names of first and second players and sets them to the label for first and second players
        firstPlayer.text = firstPlayerName + "'s"
        secondPlayer.text = secondPlayerName + "'s"
        // Calls the shuffle function and sends return value to newDeck
        newDeck = shuffle(myDeck: deckArray)
        // Sets the deckArray to newDeck
        deckArray = newDeck
        // Hides the win icons for each player
        imageFirstWin.isHidden = true
        imageSecondWin.isHidden = true
    }
    // Double to be used when delaying the presentation of the win image
    let seconds = 0.4
    @IBOutlet var secondPlayer: UILabel!
    @IBOutlet var imageFirstPlayer: UIImageView!
    @IBOutlet var imageSecondPlayer: UIImageView!
    @IBOutlet var labelFirstTotalPoints: UILabel!
    @IBOutlet var labelFirstWarPoints: UILabel!
    @IBOutlet var labelSecondTotalPoints: UILabel!
    @IBOutlet var labelSecondWarPoints: UILabel!
    @IBOutlet var firstPlayer: UILabel!
    @IBOutlet var secondPlayerThirdWar: UIImageView!
    @IBOutlet var secondPlayerSecondWar: UIImageView!
    @IBOutlet var secondPlayerFirstWar: UIImageView!
    @IBOutlet var firstPlayerThirdWar: UIImageView!
    @IBOutlet var firstPlayerSecondWar: UIImageView!
    @IBOutlet var firstPlayerFirstWar: UIImageView!
    @IBOutlet var imageSecondWin: UIImageView!
    @IBOutlet var imageFirstWin: UIImageView!
    func newGame() {
        // Calls the shuffle function and sends return value to newDeck
        newDeck = shuffle(myDeck: deckArray)
        // Assigns newDeck to deckArray
        deckArray = newDeck
        // Sets first player's points to 0
        firstPlayerPoints = 0
        // Sets second player's points to 0
        secondPlayerPoints = 0
        // Sets total points and war points for both players to 0
        labelFirstTotalPoints.text = "0"
        labelSecondTotalPoints.text = "0"
        labelFirstWarPoints.text = "0"
        labelSecondWarPoints.text = "0"
        // Transitions both player's cards to the red back
        UIView.transition(with: imageFirstPlayer, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.imageFirstPlayer.image = UIImage(named: "red_back")
        }, completion: nil)
        UIView.transition(with: imageSecondPlayer, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.imageSecondPlayer.image = UIImage(named: "red_back")
        }, completion: nil)
        // Enables flip button
        buttonFlip.isEnabled = true
    }
    
    func shuffle(myDeck: [UIImage]) -> [UIImage] {
        // Assigns inputted deck to myDeck
        var mydeck = myDeck
        // Empty array of type UIImage
        var myNewDeck: [UIImage] = []
        // Loops through the amount of cards
        for _ in 0..<mydeck.count {
            // Creates a random integer in the range of cards
            let randomizer = Int.random(in: 0..<mydeck.count)
            // Appends the removed card to myNewDeck using the index of the random integer
            myNewDeck.append(mydeck.remove(at: randomizer))
        }
        // Returns myNewDeck
        return myNewDeck
}
    
    var firstPlayerPoints: Int = 0
    var secondPlayerPoints: Int = 0
    
    func war() {
        var firstWarTotal: Int = 0
        var secondWarTotal: Int = 0
        // Checks if there is enough cards for three war cards for each player
        if newDeck.count >= 6 {
            // Removes the first card of the newDeck and assigns it to the first war card for first player. Transitions to the removed card
            let warCard1First = newDeck.removeFirst()
            UIView.transition(with: firstPlayerFirstWar, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.firstPlayerFirstWar.image = warCard1First
            })
            // Removes the first card of the newDeck and assigns it to the second war card for first player. Transitions to the removed card
            let warCard2First = newDeck.removeFirst()
            UIView.transition(with: firstPlayerSecondWar, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.firstPlayerSecondWar.image = warCard2First
            })
            // Removes the first card of the newDeck and assigns it to the third war card for first player. Transitions to the removed card
            let warCard3First = newDeck.removeFirst()
            UIView.transition(with: firstPlayerThirdWar, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.firstPlayerThirdWar.image = warCard3First
            })
            // Removes the first card of the newDeck and assigns it to the first war card for second player. Transitions to the removed card
            let warCard1Second = newDeck.removeFirst()
            UIView.transition(with: secondPlayerFirstWar, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.secondPlayerFirstWar.image = warCard1Second
            })
            // Removes the first card of the newDeck and assigns it to the second war card for first player. Transitions to the removed card
            let warCard2Second = newDeck.removeFirst()
            UIView.transition(with: secondPlayerSecondWar, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.secondPlayerSecondWar.image = warCard2Second
            })
            // Removes the first card of the newDeck and assigns it to the third war card for first player. Transitions to the removed card
            let warCard3Second = newDeck.removeFirst()
            UIView.transition(with: secondPlayerThirdWar, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.secondPlayerThirdWar.image = warCard3Second
            })
            // Receives the value of the all the war cards for the first player. Assigns the sum value to firstWarTotal
            firstWarTotal = deckPoints[warCard1First]! + deckPoints[warCard2First]! + deckPoints[warCard3First]!
            // Receives the value of the all the war cards for the second player. Assigns the sum value to secondWarTotal
            secondWarTotal = deckPoints[warCard1Second]! + deckPoints[warCard2Second]! + deckPoints[warCard3Second]!
        }
        // Checks if there are enough cards for two war cards for each player
        else if newDeck.count >= 4 {
            // Removes the first card of the newDeck and assigns it to the first war card for first player. Transitions to the removed card
            let warCard1First = newDeck.removeFirst()
            UIView.transition(with: firstPlayerFirstWar, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.firstPlayerFirstWar.image = warCard1First
            })
            // Removes the first card of the newDeck and assigns it to the second war card for first player. Transitions to the removed card
            let warCard2First = newDeck.removeFirst()
            UIView.transition(with: firstPlayerSecondWar, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.firstPlayerSecondWar.image = warCard2First
            })
            // Removes the first card of the newDeck and assigns it to the first war card for second player. Transitions to the removed card
            let warCard1Second = newDeck.removeFirst()
            UIView.transition(with: secondPlayerFirstWar, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.secondPlayerFirstWar.image = warCard1Second
            })
            // Removes the first card of the newDeck and assigns it to the second war card for second player. Transitions to the removed card
            let warCard2Second = newDeck.removeFirst()
            UIView.transition(with: secondPlayerSecondWar, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.secondPlayerSecondWar.image = warCard2Second
            })
            // Receives the value of the all the war cards for the first player. Assigns the sum value to firstWarTotal
            firstWarTotal = deckPoints[warCard1First]! + deckPoints[warCard2First]!
            // Receives the value of the all the war cards for the second player. Assigns the sum value to secondWarTotal
            secondWarTotal = deckPoints[warCard1Second]! + deckPoints[warCard2Second]!
        }
        // Checks if there are enough cards for one war card for each player
        else if newDeck.count >= 2 {
            // Removes the first card of the newDeck and assigns it to the first war card for first player. Transitions to the removed card
            let warCard1First = newDeck.removeFirst()
            UIView.transition(with: firstPlayerFirstWar, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.firstPlayerFirstWar.image = warCard1First
            })
            // Removes the first card of the newDeck and assigns it to the first war card for second player. Transitions to the removed card
            let warCard1Second = newDeck.removeFirst()
            UIView.transition(with: secondPlayerFirstWar, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.secondPlayerFirstWar.image = warCard1Second
            })
            // Receives the value of the war card for the first player and assigns it to firstWarTotal
            firstWarTotal = deckPoints[warCard1First]!
            // Receives the value of the war card for the second player and assigns it to secondWarTotal
            secondWarTotal = deckPoints[warCard1Second]!
        }
        // Sets the text of the label for first player war points to firstWarTotal
        labelFirstWarPoints.text = String(firstWarTotal)
        // Sets the text of the label for second player war points to secondWarTotal
        labelSecondWarPoints.text = String(secondWarTotal)
        // If firstWarTotal is greater than secondWarTotal, add 2 to firstPlayerPoints and set the text of the label of first player's total points to firstPlayerPoints. Then show the win icon for the first player
        if firstWarTotal > secondWarTotal {
            firstPlayerPoints += 2
            labelFirstTotalPoints.text = String(firstPlayerPoints)
            // Delays the presentation of the image
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
                self.imageFirstWin.isHidden = false
            }
        }
        // If secondWarTotal is greater than firstWarTotal, add 2 to secondPlayerPoints and set the text of the label of second player's total points to secondPlayerPoints. Then show the win icon for the second player
        else if secondWarTotal > firstWarTotal {
            secondPlayerPoints += 2
            labelSecondTotalPoints.text = String(secondPlayerPoints)
            // Delays the presentation of the image
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
                self.imageSecondWin.isHidden = false
            }
        }
        // If firstWarTotal and secondWarTotal are equal to each other, add 1 to firstPlayerPoints and set the text of the label of first player's total points to firstPlayerPoints, and add 1 to secondPlayerPoints and set the text of the label of second player's total points to secondPlayerPoints. Then show the win image for both players
        else if firstWarTotal == secondWarTotal {
            firstPlayerPoints += 1
            labelFirstTotalPoints.text = String(firstPlayerPoints)
            secondPlayerPoints += 1
            labelSecondTotalPoints.text = String(secondPlayerPoints)
            // Delays the presentation of the image
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
                self.imageFirstWin.isHidden = false
                self.imageSecondWin.isHidden = false
            }
        }
    }
    
    func flip() {
        // Assigns the first player's card to the first removed card from newDeck
        let cardForFirst = newDeck.removeFirst()
        // Assigns the second player's card to the first removed card from newDeck
        let cardForSecond = newDeck.removeFirst()
        // Transitions the image of the card for the first player to the card for first player
        UIView.transition(with: imageFirstPlayer, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.imageFirstPlayer.image = cardForFirst
        })
        // Transitions the image of the card for the second player to the card for second player
        UIView.transition(with: imageSecondPlayer, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.imageSecondPlayer.image = cardForSecond
        })
        // If the points for the first player's card are greater than the points for the second player's card, add 2 to first player's points and set the text of the label to the first player's points. Then set all war points to zero. Then show the win icon for the first player
        if deckPoints[cardForFirst]! > deckPoints [cardForSecond]! {
            firstPlayerPoints += 2
            labelFirstTotalPoints.text = String(firstPlayerPoints)
            labelFirstWarPoints.text = "0"
            labelSecondWarPoints.text = "0"
            // Delays the presentation of the image
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
                self.imageFirstWin.isHidden = false
            }
        // If the points for the first player's card are less than the points for the second player's card, add 2 to second player's points and set the text of the label to the second player's points. Then set all war points to zero. Then show the win icon for the second player
        } else if deckPoints[cardForFirst]! < deckPoints[cardForSecond]! {
            secondPlayerPoints += 2
            labelSecondTotalPoints.text = String(secondPlayerPoints)
            labelFirstWarPoints.text = "0"
            labelSecondWarPoints.text = "0"
            // Delays the presentation of the image
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
                self.imageSecondWin.isHidden = false
            }
        // If the points for the first player's card are equal to the points for the second player's card and newDeck is not empty, run the war function
        } else if deckPoints[cardForFirst]! == deckPoints[cardForSecond]! && newDeck.isEmpty == false {
            war()
        // If the points for the first player's card are equal to the points for the second player's card and newDeck is empty, add 1 to both player's total points and set the text of each player to their points. Then set all war points to zero. Then show the win icon for the both players
        } else if deckPoints[cardForFirst]! == deckPoints[cardForSecond]! && newDeck.isEmpty {
            firstPlayerPoints += 1
            labelFirstTotalPoints.text = String(firstPlayerPoints)
            secondPlayerPoints += 1
            labelSecondTotalPoints.text = String(secondPlayerPoints)
            labelFirstWarPoints.text = "0"
            labelSecondWarPoints.text = "0"
            // Delays the presentation of the image
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
                self.imageFirstWin.isHidden = false
                self.imageSecondWin.isHidden = false
            }
        }
    }
    // Array of all the cards in the deck
    var deckArray: [UIImage] = [UIImage(named: "2C")!, UIImage(named: "2D")!, UIImage(named: "2H")!, UIImage(named: "2S")!, UIImage(named: "3C")!, UIImage(named: "3D")!, UIImage(named: "3H")!, UIImage(named: "3S")!, UIImage(named: "4C")!, UIImage(named: "4D")!, UIImage(named: "4H")!, UIImage(named: "4S")!, UIImage(named: "5C")!, UIImage(named: "5D")!, UIImage(named: "5H")!, UIImage(named: "5S")!, UIImage(named: "6C")!, UIImage(named: "6D")!, UIImage(named: "6H")!, UIImage(named: "6S")!, UIImage(named: "7C")!, UIImage(named: "7D")!, UIImage(named: "7H")!, UIImage(named: "7S")!, UIImage(named: "8C")!, UIImage(named: "8D")!, UIImage(named: "8H")!, UIImage(named: "8S")!, UIImage(named: "9C")!, UIImage(named: "9D")!, UIImage(named: "9H")!, UIImage(named: "9S")!, UIImage(named: "10C")!, UIImage(named: "10D")!, UIImage(named: "10H")!, UIImage(named: "10S")!, UIImage(named: "JC")!, UIImage(named: "JD")!, UIImage(named: "JH")!, UIImage(named: "JS")!, UIImage(named: "QC")!, UIImage(named: "QD")!, UIImage(named: "QH")!, UIImage(named: "QS")!, UIImage(named: "KC")!, UIImage(named: "KD")!, UIImage(named: "KH")!, UIImage(named: "KS")!, UIImage(named: "AC")!, UIImage(named: "AD")!, UIImage(named: "AH")!, UIImage(named: "AS")!]
    // Array for the shuffled cards
    var newDeck: [UIImage] = []
    // Point values for all the cards
    var deckPoints: [UIImage: Int] = [UIImage(named: "2C")!: 2, UIImage(named: "2D")!: 2, UIImage(named: "2H")!: 2, UIImage(named: "2S")!: 2, UIImage(named: "3C")!: 3, UIImage(named: "3D")!: 3, UIImage(named: "3H")!: 3, UIImage(named: "3S")!: 3, UIImage(named: "4C")!: 4, UIImage(named: "4D")!: 4, UIImage(named: "4H")!: 4, UIImage(named: "4S")!: 4, UIImage(named: "5C")!: 5, UIImage(named: "5D")!: 5, UIImage(named: "5H")!: 5, UIImage(named: "5S")!: 5, UIImage(named: "6C")!: 6, UIImage(named: "6D")!: 6, UIImage(named: "6H")!: 6, UIImage(named: "6S")!: 6, UIImage(named: "7C")!: 7, UIImage(named: "7D")!: 7, UIImage(named: "7H")!: 7, UIImage(named: "7S")!: 7, UIImage(named: "8C")!: 8, UIImage(named: "8D")!: 8, UIImage(named: "8H")!: 8, UIImage(named: "8S")!: 8, UIImage(named: "9C")!: 9, UIImage(named: "9D")!: 9, UIImage(named: "9H")!: 9, UIImage(named: "9S")!: 9, UIImage(named: "10C")!: 10, UIImage(named: "10D")!: 10, UIImage(named: "10H")!: 10, UIImage(named: "10S")!: 10, UIImage(named: "JC")!: 11, UIImage(named: "JD")!: 11, UIImage(named: "JH")!: 11, UIImage(named: "JS")!: 11, UIImage(named: "QC")!: 12, UIImage(named: "QD")!: 12, UIImage(named: "QH")!: 12, UIImage(named: "QS")!: 12, UIImage(named: "KC")!: 13, UIImage(named: "KD")!: 13, UIImage(named: "KH")!: 13, UIImage(named: "KS")!: 13, UIImage(named: "AC")!: 14, UIImage(named: "AD")!: 14, UIImage(named: "AH")!: 14, UIImage(named: "AS")!: 14]
    
    @IBOutlet var buttonFlip: UIButton!
    @IBAction func buttonFlipPressed(_ sender: UIButton) {
        // Set all war card images to nil
        firstPlayerFirstWar.image = nil
        firstPlayerSecondWar.image = nil
        firstPlayerThirdWar.image = nil
        secondPlayerFirstWar.image = nil
        secondPlayerSecondWar.image = nil
        secondPlayerThirdWar.image = nil
        // Hide the win icons for both players
        imageFirstWin.isHidden = true
        imageSecondWin.isHidden = true
        // If newDeck is empty
        if newDeck.isEmpty {
            // Disable flip button
            buttonFlip.isEnabled = false
            // If first player's points is greater than second player's points, present an alert that says that first player wins, with two buttons. Also present the points for each player
            if firstPlayerPoints > secondPlayerPoints {
                let alert = UIAlertController(title: "Congratulations", message: "Congratulations \(firstPlayerName)! You won! \(firstPlayerName) got \(firstPlayerPoints) points and \(secondPlayerName) got \(secondPlayerPoints) points.", preferredStyle: .alert)
                // First button will start a new game using the newGame function, if pressed
                alert.addAction(UIAlertAction(title: "Start New Game", style: .default, handler: { (action:UIAlertAction) in
                    self.newGame()
                }))
                // Second button will call the newGame function and go back to the root ViewController
                alert.addAction(UIAlertAction(title: "Main Menu", style: .default, handler: { (action:UIAlertAction) in
                    self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                    self.newGame()
                }))
                // Presents the alert
                self.present(alert, animated: true, completion: nil)
            }
            // If second player's points is greater than first player's points, present an alert that says that second player wins, with two buttons. Also present the points for each player
            else if secondPlayerPoints > firstPlayerPoints {
                let alert = UIAlertController(title: "Congratulations", message: "Congratulations \(secondPlayerName)! You won! \(secondPlayerName) got \(secondPlayerPoints) points and \(firstPlayerName) got \(firstPlayerPoints) points.", preferredStyle: .alert)
                // First button will start a new game using the newGame function, if pressed
                alert.addAction(UIAlertAction(title: "Start New Game", style: .default, handler: { (action:UIAlertAction) in
                    self.newGame()
                }))
                // Second button will call the newGame function and go back to the root ViewController
                alert.addAction(UIAlertAction(title: "Main Menu", style: .default, handler: { (action:UIAlertAction) in
                    self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                    self.newGame()
                }))
                // Presents the alert
                self.present(alert, animated: true, completion: nil)
            }
            // If the first player's points are equal to the second player's points, then present an alert that says that there is a tie, with two buttons. Also present the points for each player
            else if firstPlayerPoints == secondPlayerPoints {
                let alert = UIAlertController(title: "Thanks for playing!", message: "No one won! \(firstPlayerName) got \(firstPlayerPoints) points and \(secondPlayerName) got \(secondPlayerPoints) points.", preferredStyle: .alert)
                // First button will start a new game using the newGame function, if pressed
                alert.addAction(UIAlertAction(title: "Start New Game", style: .default, handler: { (action:UIAlertAction) in
                    self.newGame()
                }))
                // Second button will call the newGame function and go back to the root ViewController
                alert.addAction(UIAlertAction(title: "Main Menu", style: .default, handler: { (action:UIAlertAction) in
                    self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                    self.newGame()
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        // Otherwise run the flip function
        else {
            flip()
        }
    }
    
    @IBAction func buttonMainMenuPressed(_ sender: UIButton) {
        // Runs the newGame function
        newGame()
       // Returns to the root ViewController
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
