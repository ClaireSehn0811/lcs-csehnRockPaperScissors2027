# Rock Paper Scissors

You against the computer. Click a move, and the computer picks one at random.
 
## How to play
 
1. Click **Rock**, **Paper**, or **Scissors**.
2. The computer shows its move beside yours.
3. Rock beats scissors, scissors beats paper, and paper beats rock.
 
## What I added
 
- The game now tells the player when they have won or lost. 
- The game shows the player's "Win streak", for how many times they have won. 
- The game has an "Easy Mode" and "Hard Mode" options so they player can customize the difficulty when playing.
- The colour of the result text changes depending on result. When player wins, text is green. When player looses, text is red. Whem it is a tie, text is grey. 
## Testing
| Test | Chosen Input | What should happen | Did happen |
| --- | --- | --- | --- |
|  Text change when I win |  Computer fixed at 1, I chose paper. | The result says who one won: "You win, paper covers rock!" |  I won. \*Note. I completed this in class on Friday, October 23 but did not commit it, hence why the change does not appear under the repositories. |
| Win Streak | Computer fixed at 1, I chose paper | After playing the game multiple times, result says who one won: "You win, paper covers rock!"|  After selecting paper multiple times, the win streak increased.  |
**Test: **Easy Mode 
**Chosen input:** Continuos sequence of computer playing rock, then paper, then scissors 
**What should happen:** After playing paper, scissors, rock I should win everytime. 
**What did happen: **I won everytime I selected paper, scissors, rock in that order. Win streak increased.

**Test:** Hard Mode
**Chosen input:** Clicked hard mode then rock
**What should happen: **Computer generates a random move (1..3) 
**What did happen: **Random computermove was played, result was not consistent allowing for win streak to change. 

**Test:** Win text result colour
**Chosen input: **Selected easy mode, player chooses paper, computer chooses rock. 
**What should happen:** Result text becomes green. 
**What did happen:** Result text became green. 

**Test:** Loose text result colour
**Chosen input: **Selected easy mode, player chooses scissors, computer chooses rock. 
**What should happen:** Player looses, result text becomes red. 
**What did happen: **Play lost, result text became red. 

**Test:** Tie text result colour
**Chosen input****: **Selected easy mode, player chooses rock, computer chooses rock. 
**What should happen: **Tie, result text becomes grey.
**What did happen:** Tie, result text became grey. 
## Credits
 
- The starting game was written by Mr. Gordon.
- To create the game, Gemini AI was used. This platform helped me add the win streak, levels of difficulty to the game, and colour of result text.


