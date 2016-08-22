Page 41 [Image]:
if i <= 1
WE ARE DONE
Code sample is `i <= 0`. Should match?

Page 43 [Snippet 2]:
def greet2(name):
    ...
    def bye():
        print "ok bye!"
`def bye()` should be aligned with `def greet2(name)` not nested?



Chapter 8 (Code):

best_station = None
states_covered = set()
for station, states_for_station in stations.items():

final loop has:

  best_station = None
  states_covered = set()

for station, states in stations.items():

should be states for both?

~

Chapter 8 (final algorithm):

Can't seem to get Jupyter Notebook, Kernel: Python 2.7 to run the while loop? Times out?

Might just be me? Or one of my typos?

~

Chapter 9 (Image/Example):

Knapsack items are 4lbs, 3lbs, 1lbs.
Chapter 8 items are 30lbs, 20lbs, 15lbs.

Values should be the same?

~

Suggestion:

Make the difference between pseudo-code, intermediate code, and executable code more explicit?

~

Suggestion:

Full executable python algorithms for Chapter 9 and 10? Given the awesome pace of the early chapters I was disappointed that there wasn't any executable code in 9 and 10 :(



---



So you started out with a 1680 × 640 farm that needed to be split up. But now you need to split up a smaller segment, 640 × 400. If you nd the biggest box that will work for this size, that will be the biggest box that will work for the entire farm. You just reduced the problem from a 1680 × 640 farm to a 640 × 400 farm!

I think it's confusing as it's using W X H for 1680 x 640 but H X W for 640 x 400

So should it not be?

So you started out with a 1680 × 640 farm that needed to be split up. But now you need to split up a smaller segment, 400 × 680. If you nd the biggest box that will work for this size, that will be the biggest box that will work for the entire farm. You just reduced the problem from a 1680 × 640 farm to a 400 × 680 farm!

