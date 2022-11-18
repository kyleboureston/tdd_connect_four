# Connect Four

## Description

Connect Four is a two-player turn-based board game. Each turn, a player is allowed to drop one piece of their color onto the board. A player wins by getting four of their color piece in a row on the board.

This project was developed using Test Driven Development (TDD).

## Play Here
[![Run on Repl.it](https://repl.it/badge/github/kybow/connectfour)](https://replit.com/@kybow/connectfour)


## Technologies used
<p align="left">
<a href="https://www.ruby-lang.org/en/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ruby/ruby-original.svg" alt="ruby" width="40" height="40"/> </a>
<a href="https://rspec.info/" target="_blank" rel="noreferrer"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/rspec/rspec-original.svg" alt="rspec" width="40" height="40"/> </a> </p>

## Why I created this

This was the second-to-last project on The Odin Project's Ruby course. But on top of that, connect four is a darn-cool game that I personally enjoy.

## Project Objectives

My two main objectives for this project were:
1. **TDD.** I developed this game using TDD and the testing framework rspec. All tests can be found under the /spec folder. I found Sandi Metz talk, "The Magic Tricks of Testing" extremely helpful. Specifically, I appreciated her simple breakdown of query vs command messages, and what to test for each of those message types. Here is a link to that point in her talk: https://youtu.be/URSWYvyc42M?t=1669
2. **Github.** I used (really used) Github for the first time! At first, I found it slowed me down... but once I learned VS Code's interface for selective commiting and pushing, it became really quick and natural.

## Things I learned / enjoyed

I learned some really great things about Ruby during this project:
* **Monkeypatching.** I used a monkeypatch to be able to selectively add colors on top of strings. This monkeypatch can be found in at lib/colors.rb. This allowed me to give players the option to select the color of their pieces and added a fun visual element to the game. I includes the player's color as a background to the messages addressed to them to make it more clear whose turn it was.
* **Classes.** As classes and OOP are the basis of Ruby, I have definitely used them a lot in the past. Through this project, it clicked much more when and where to use them. I heavily leveraged the Cage class which helped me keep seperate the logic of the game (ex: game#play_turn) and the cage (ex: cage#update). This helped keep things more clean and clear, but also helped me to keep things private from classes that did not need to be shared. I made of point of letting classes update themselves with a method (ex: cage#update)... rather than having one class update another (ex: (from Game class) cage.arr = [1, 2, 3]).
* **Simple User Selections.** Not revolutionary, but I really liked how I set up the flow to allow users to pick their own color. In the game.rb Class, I created an array as an @instance_variable with all the possible colors. When the user was asked what color they wanted, I simply used this array to display all the options. I also used this array to check that the player had entered a valid color (color_arr.includes?(player_color_selection). The cool part (to me) was once Player1 picked their color, I simply removed that color from the color_arr. Thus, when Player2 was asked what color they wanted to be, Player1's color was never even an option (it also was no longer a legal color option in the valid_color_check). Simple, I know... but I really appreciate the effective simplicity of it!
* **Diaganol-Winner Checking.** In an attempt to spice up this project a bit, I made the cage size variable. The player was allowed to select their cage, between 5 and 9. The result created a cage sized 5x5, 6x6, 7x7, 8x8, or 9x9. It added an interesting spin to the traditional game, and I thought the asssociated development wouldn't be too hard. I was, mostly, correct on the latter half of that statement. The difficulty came when check if a player had won the game with four diaganol pieces in a row. To solve this problem, I used a combination of a resetting counter and recursion. I checked each cell. If the cell was the players_token, I found the coordinates for the next diaganol piece (1 row over, 1 column up) and recusively ran the method using that piece. If that piece was also the players piece, counter += 1. If it wasn't, I reset the counter (counter == 1). 
