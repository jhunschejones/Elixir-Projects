# Auction

## Overview
This is a Phoenix 1.4 application I built while working through the *Phoenix in Action* book in the summer of 2019. It marks the first app I've built with this version of the Phoenix framework, and though the design mirrors much of the project that was laid out in the book, I had to create and configure many details of the actual implementations on my own due to changes in how the framework version works. The app allows a user to create an account, sign in, create items, and bid on items. It also provides an API for accessing items and bids stored in it's database.

## Lessons Learned
I really liked watching the way the authors constructed an Elixir application in stages, rather than just as a single web app. Though I ended up having to pave my own path to the final product, their thought process helped me conceptualize the new `contexts` portion of Phoenix 1.4 apps in a way that made more sense to me than past efforts in this area. While working on this project I also learned more about common security practices around user authentication, deserialization, and password hashing. Finally, I feel much more comfortable working with Ecto, and pounding out the skeleton of an application in Phoenix after completing this project. I look forward to putting these tools to use on upcoming projects, and continuing to work with the Elixir ecosystem to learn more of what's possible.

## To start the application:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.