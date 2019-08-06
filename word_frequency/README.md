# Word Frequency

The Word Frequency app scans input text and outputs the most frequent three-word sequences. I am completing this project as an opportunity to work with some Elixir modules I might not normally use in the context of a web app.

## Interacting With the App
To run tests, `mix test`
To run with direct input, `elixir ./lib/word_frequency.ex ./texts/moby-dick.txt`
To run with streamed input, `cat ./texts/moby-dick.txt | elixir ./lib/word_frequency.ex`
For a basic timing test try, `time elixir ./lib/word_frequency.ex ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt &> /dev/null`
