# Word Frequency

The Word Frequency app scans input text and outputs the most frequent three-word sequences. I am completing this project as an opportunity to work with some Elixir modules I might not normally use in the context of a web app.

## Interacting With the App
First, build the executable: `mix escript.build`
Then, to run tests: `mix test`

To run with direct input, `./word_frequency ./texts/moby-dick.txt`
To run with streamed input, `cat ./texts/moby-dick.txt | ./word_frequency`
For a basic timing test try, `time ./word_frequency ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt &> /dev/null`
