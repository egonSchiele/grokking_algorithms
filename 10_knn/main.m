function foo = main()
    addpath('mnistHelper');
    train_images = loadMNISTImages('train-images-idx3-ubyte');
    train_labels = loadMNISTLabels('train-labels-idx1-ubyte');

    test_images = loadMNISTImages('t10k-images-idx3-ubyte');
    test_labels = loadMNISTLabels('t10k-labels-idx1-ubyte');

    % showData(train_images, 100, 100);
    guesses(20, 3, train_images, train_labels, test_images, test_labels);
end

function foo = showData(images, rows, cols)
    grid = [];

    i = 0;
    for x = 1:rows
        imgs = [];
        for y = 1:cols
           i = i + 1;
           imgs = [imgs reshape(images(:, i), 28, 28)];
        end
        grid = [grid; imgs];
    end
    imshow(grid);
end

function d = distance(train_image, test_image)
    v = train_image - test_image;
    v = double(v);
    d = sqrt(v * v');
end

function result = border(image, value)
  image = reshape(image, 28, 28);
  result = zeros(28, 28);
  result(:, :) = value;
  result(2:27, 2:27) = image(2:27, 2:27);
  result = reshape(result, 784, 1);
end

function foo = guesses(count, k, train_images, train_labels, test_images, test_labels)
    [foo num_train_images] = size(train_images);
    [foo num_test_images] = size(test_images);

    correct = 0;

    grid = [];
    for x_ = 1:count
        x = floor(rand() * num_test_images);
        test_image = test_images(:, x);        
        correct_label = test_labels(x);
        dist = [];
        num_train_images = 50000;
        for i = 1:num_train_images

            train_image = train_images(:, i);
            d = distance(train_image', test_image');
            dist = [dist; [d i]];
        end
        sorted_ = (sortrows(dist, 1));
        sorted = sorted_(1:k, :);
        labels = [];
        for i = 1:k
          grid = [grid train_images(:, sorted(i, 2))];
          labels = [labels train_labels(sorted(i, 2))];
        end
        guess_label = mode(labels);
        if guess_label == correct_label
            correct = correct + 1;
            grid = [grid test_image];
        else
            grid = [grid border(test_image, 255)];
        end
    end
    correct
    
    showData(grid, count, k+1);
end
