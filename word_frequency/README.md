# Word Frequency

The Word Frequency app scans input text and outputs the most frequently occurring three-word sequences. I am completing this exercise as an opportunity to work with some Elixir modules I might not normally use in the context of a web app. It also provides the chance to see the performance impact of different FP design decisions.

## Using the App
1. Build an executable: `mix escript.build`
2. Run tests: `mix test`
3. Try it out!
  * To run with direct input, `./word_frequency ./texts/moby-dick.txt`
  * To run with streamed input, `cat ./texts/moby-dick.txt | ./word_frequency`
  * For a basic timing test try, `time ./word_frequency ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt &> /dev/null`
  * To see system resources used, `/usr/bin/time -l ./word_frequency ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt ./texts/moby-dick.txt`
