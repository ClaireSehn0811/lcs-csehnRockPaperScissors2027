//
//  RockPaperScissorsView.swift
//  RockPaperScissors
//
//  WHAT THIS GAME DOES NOW
//  You pick rock, paper or scissors. The computer picks one at random.
//  The app shows both moves and counts how many rounds you have played.
//  It can tell when a round is a tie.
//
//  WHAT IT DOES NOT DO YET
//  When the two moves are different, it only says "Someone won".
//  It does not know who!
//  Rock beats scissors, scissors beats paper, and paper beats rock.
// For MAKE IT YOURS, the game now holds a winning streak for the player, and it says if the player has won or lost.

import SwiftUI

// The picture for each move. These are emoji, so they are just text.
// TRY: Change these to other emoji to give the game a new theme.
let rockEmoji: String = "🪨"
let paperEmoji: String = "📄"
let scissorsEmoji: String = "✂️"

// The game itself: what it remembers, what it shows on the screen,
// and what it does when you click a button.
struct RockPaperScissorsView: View {
    
    // MARK: - Stored properties
    
    // Each @State variable is something the game remembers.
    // When one of them changes, the screen updates by itself.
    
    // The name of each move, such as "Rock", and the emoji that shows it.
    // Before the first round, nobody has picked a move yet.
    @State var playerMove: String = "No move yet"
    @State var playerEmoji: String = "❓"
    @State var computerMove: String = "No move yet"
    @State var computerEmoji: String = "❓"
    
    // What happened in the last round.
    @State var result: String = "Let's Play Rock, Paper, Scissors! Can you beat the computer?"
    
    // How many rounds have been played.
    @State var roundsPlayed: Int = 0
    
    // Winnning streak for the player
    @State var currentWinStreak: Int = 0
    
    //Hard Mode and Easy Mode
    @State var isHardMode: Bool = true
    @State var easyModeStep: Int = 0
   
    
    // Colour of result text
    var resultColor: Color {
        if result.contains("win") {
            return Color.green
        } else if result.contains("lost") {
            return Color.red
        } else {
            return Color.gray
        }
    }
    
    // MARK: - Computed properties
    
    var body: some View {
        VStack(spacing: 24) {
            
            // The title at the top of the screen.
            Text("Rock Paper Scissors")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.teal)
            // Shrink the title a little if it does not fit on one line.
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            // The two moves, side by side.
            HStack {
                VStack(spacing: 8) {
                    Label("You", systemImage: "person.fill")
                        .font(.headline)
                    Text(playerEmoji)
                        .font(.system(size: 90))
                    Text(playerMove)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
                
                Text("vs")
                    .font(.title)
                    .foregroundStyle(Color.secondary)
                
                VStack(spacing: 8) {
                    Label("Computer", systemImage: "desktopcomputer")
                        .font(.headline)
                    Text(computerEmoji)
                        .font(.system(size: 90))
                    Text(computerMove)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            .background(Color.teal.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            // Colour, font, and size of Win Streak Text
            Text("Win Streak: \(currentWinStreak)")
                .font(.headline)
                .foregroundStyle(Color.teal)
                .font(.system(size: 90))
            
            
            // The result of the round.
            Text(result)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(resultColor)
            
            Spacer()
            
            
            // Creates hard mode and easy mode, player can select their preferance.
            Button("Easy Mode") {
                isHardMode = false
                easyModeStep = 0
                
            }
            
            Button("Hard Mode") {
                isHardMode = true
            }
            
            // One button for each move the player can make.
            // The code inside the braces runs when that button is clicked.
            Text("Play your move: Rock Paper or Scissors")
                .font(.headline)
                .foregroundStyle(Color.secondary)
            
            HStack(spacing: 12) {
                Button {
                    chooseRock()
                } label: {
                    VStack {
                        Text(rockEmoji)
                            .font(.system(size: 44))
                        Text("Rock")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    choosePaper()
                } label: {
                    VStack {
                        Text(paperEmoji)
                            .font(.system(size: 44))
                        Text("Paper")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    chooseScissors()
                } label: {
                    VStack {
                        Text(scissorsEmoji)
                            .font(.system(size: 44))
                        Text("Scissors")
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.bordered)
            .font(.headline)
            //Colour and style of Rounds Played
            .tint(Color.blue)
            
            Text("Rounds played: \(roundsPlayed)")
                .font(.headline)
                .foregroundStyle(Color.secondary)
        }
        .padding(32)
        .fontDesign(.rounded)
        // How big the game's window is on the Mac. It can be made taller or wider.
        .frame(minWidth: 520, minHeight: 640)
        
        
    }
    
    // MARK: - Functions
    
    // The player picked rock.
    func chooseRock() {
        playerMove = "Rock"
        playerEmoji = rockEmoji
        playRound()
    }
    
    // The player picked paper.
    func choosePaper() {
        playerMove = "Paper"
        playerEmoji = paperEmoji
        playRound()
    }
    
    // The player picked scissors.
    func chooseScissors() {
        playerMove = "Scissors"
        playerEmoji = scissorsEmoji
        playRound()
    }

        // The computer picks its move based on difficulty mode.
            func chooseComputerMove() {
                if isHardMode == true {
                    let randomNumber: Int = Int.random(in: 1...3)
                    
                    if randomNumber == 1 {
                        computerMove = "Rock"
                        computerEmoji = rockEmoji
                    } else if randomNumber == 2 {
                        computerMove = "Paper"
                        computerEmoji = paperEmoji
                    } else if randomNumber == 3 {
                        computerMove = "Scissors"
                        computerEmoji = scissorsEmoji
                    }
                } else {
                    if easyModeStep == 0 {
                        computerMove = "Rock"
                        computerEmoji = rockEmoji
                    } else if easyModeStep == 1 {
                        computerMove = "Paper"
                        computerEmoji = paperEmoji
                    } else if easyModeStep == 2 {
                        computerMove = "Scissors"
                        computerEmoji = scissorsEmoji
                    }
                    
                    easyModeStep = (easyModeStep + 1) % 3
                }
            }
    
    
    // Plays one round, once the player has picked a move.
    func playRound() {
        chooseComputerMove()
        roundsPlayed += 1
        winner ()
    }
    
    
    // How winner is decided, impacts the player's winning streak
    func winner () {
        if playerMove == computerMove {
            result = "It's a tie!"
        } else if playerMove == "Rock" && computerMove == "Paper" {
            result = "You lost, paper covers rock!"
            currentWinStreak = 0
        } else if playerMove == "Rock" && computerMove == "Scissors" {
            result = "You win, rock breaks scissors!"
            currentWinStreak += 1
        } else if playerMove == "Paper" && computerMove == "Rock" {
            result = "You win, paper covers rock!"
            currentWinStreak += 1
        } else if playerMove == "Paper" && computerMove == "Scissors" {
            result = "You lost, scissors cuts paper!"
            currentWinStreak = 0
        } else if playerMove == "Scissors" && computerMove == "Paper" {
            result = "You win, scissors cuts paper!"
            currentWinStreak += 1
        } else if playerMove == "Scissors" && computerMove == "Rock" {
            result = "You lost, rock breaks scissors!"
            currentWinStreak = 0
        }
        
        
        
        
        #Preview{
            RockPaperScissorsView()
        }
    }
}
