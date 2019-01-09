## Digit recognition with knn

Here's some example Matlab code that shows KNN in action to guess handwritten digits. Here's what the output looks like:

![](https://github.com/egonSchiele/grokking_algorithms/blob/master/10_knn/images/17_correct_500_comparisons.png)

Each row represents a guess. The last column contains the image that we're trying to guess the digit for. The first three columns show the 3 nearest neighbors for that last image.

Images with boxes around them represent images that we did not guess correctly. You can see KNN works pretty well -- with just 500 comparison images we are getting 80% accuracy. This jumps to 90% with 5000 comparison images (see the images/ directory).

[Uses the MNIST dataset](http://yann.lecun.com/exdb/mnist/)
