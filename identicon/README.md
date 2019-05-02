# Identicon

## Overview
This application takes a user input string and generates an image that is identical each time the same string is passed in. The image will be a 5 x 5 grid with some squares filled in and some blank, forming a vertically minor-image pattern. Additionally, the color of the filled in squares will be different depending on what input the user provides. The result is a fairly unique, yet simple looking image that can be recalculated on the fly each time it is needed, as long as the initial input string is available. This is similar to the default profile images on GitHub, and was a great challenge to help push my Elixir skills forward!

## Solution
Pattern matching a functions input parameter turns out to be a great way to use this signature Elixir function even more efficiently! Like the previous projects here, facing new challenges helped me gain more familiarity with Elixir’s built-in modules and the functions they provide. _(There have even been a couple pieces of functionality I've needed to borrow from Erlang!)_ I continue to be impressed with how many detailed algorithms work straight out of the box, and I am starting to develop better habits of looking for a built in function before rolling my own *_(as I might have for challenging algorithms in JavaScript.)_* I also pushed myself to actively write documentation and tests for my functions as I identified and completed small units of work. This workflow has been incredibly easy to implement in Elixir, and I can definitely see the power it might bring to a larger scale endeavor. 

### To run the app:
1. Pull down the project and install Elixir
2. From the `identicon` directory, run `iex -S mix`
3. In `iex`, run `Identicon.main("YOUR_STRING")` to create an identicon from any string you like!

_BONUS: To view the `ex_doc` docs, pull down this directory, install Elixir, and run `mix docs`._
