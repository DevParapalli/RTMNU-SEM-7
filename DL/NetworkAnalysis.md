# LeNet-5

## Input
* Input image size: 32×32×1 (grayscale images)

## Layer 1: Convolutional Layer
* Layer type: Convolutional
* Input size: 32×32×1
* Output size: 28×28×6
* Kernel size: 5×5
* Number of filters: 6
* Stride: 1
* Padding: None
* Number of parameters: (5×5×1×6) + 6 = 156
* Activation function: Tanh

## Layer 2: Average Pooling Layer
* Layer type: Average Pooling
* Input size: 28×28×6
* Output size: 14×14×6
* Kernel size: 2×2
* Stride: 2
* Number of parameters: 0
* No activation function

## Layer 3: Convolutional Layer
* Layer type: Convolutional
* Input size: 14×14×6
* Output size: 10×10×16
* Kernel size: 5×5
* Number of filters: 16
* Stride: 1
* Padding: None
* Number of parameters: (5×5×6×16) + 16 = 2,416
* Activation function: Tanh

## Layer 4: Average Pooling Layer
* Layer type: Average Pooling
* Input size: 10×10×16
* Output size: 5×5×16
* Kernel size: 2×2
* Stride: 2
* Number of parameters: 0
* No activation function

## Layer 5: Convolutional Layer
* Layer type: Convolutional
* Input size: 5×5×16
* Output size: 1×1×120
* Kernel size: 5×5
* Number of filters: 120
* Stride: 1
* Number of parameters: (5×5×16×120) + 120 = 48,120
* Activation function: Tanh

## Layer 6: Fully Connected Layer
* Layer type: Fully Connected
* Input size: 120
* Output size: 84
* Number of parameters: (120×84) + 84 = 10,164
* Activation function: Tanh

## Layer 7: Fully Connected Layer (Output)
* Layer type: Fully Connected
* Input size: 84
* Output size: 10
* Number of parameters: (84×10) + 10 = 850
* Activation function: Softmax

## Output
* Final output: 10 classes
* Output format: Probability distribution over 10 classes

## Summary
* Total number of layers: 7 (3 convolutional, 2 pooling, 2 fully connected)
* Total number of trainable parameters: 61,706
* Network characteristics:
  - Uses tanh activation throughout except final softmax
  - Alternates between convolutional and pooling layers
  - Reduces spatial dimensions while increasing feature depth
  - Ends with fully connected layers for classification
* Primary application: Handwritten digit recognition (MNIST dataset)
* Architecture features gradual reduction in spatial dimensions and increase in feature channels


# AlexNet

## Input
* Input size: 227 x 227 x 3 RGB image
* Preprocessing: Image normalization

## Layer 1 (Conv1)
* Layer type: Convolutional
* Input size: 227 x 227 x 3
* Output size: 55 x 55 x 96
* Kernel size: 11 x 11
* Stride: 4
* Padding: 0
* Number of filters: 96
* Parameters: (11 x 11 x 3 x 96) + 96 = 34,944
* Activation: ReLU
* Additional: Local Response Normalization (LRN)

## Layer 2 (Pool1)
* Layer type: Max Pooling
* Input size: 55 x 55 x 96
* Output size: 27 x 27 x 96
* Kernel size: 3 x 3
* Stride: 2
* Parameters: 0

## Layer 3 (Conv2)
* Layer type: Convolutional
* Input size: 27 x 27 x 96
* Output size: 27 x 27 x 256
* Kernel size: 5 x 5
* Stride: 1
* Padding: 2
* Number of filters: 256
* Parameters: (5 x 5 x 96 x 256) + 256 = 614,656
* Activation: ReLU
* Additional: Local Response Normalization (LRN)

## Layer 4 (Pool2)
* Layer type: Max Pooling
* Input size: 27 x 27 x 256
* Output size: 13 x 13 x 256
* Kernel size: 3 x 3
* Stride: 2
* Parameters: 0

## Layer 5 (Conv3)
* Layer type: Convolutional
* Input size: 13 x 13 x 256
* Output size: 13 x 13 x 384
* Kernel size: 3 x 3
* Stride: 1
* Padding: 1
* Number of filters: 384
* Parameters: (3 x 3 x 256 x 384) + 384 = 885,120
* Activation: ReLU

## Layer 6 (Conv4)
* Layer type: Convolutional
* Input size: 13 x 13 x 384
* Output size: 13 x 13 x 384
* Kernel size: 3 x 3
* Stride: 1
* Padding: 1
* Number of filters: 384
* Parameters: (3 x 3 x 384 x 384) + 384 = 1,327,488
* Activation: ReLU

## Layer 7 (Conv5)
* Layer type: Convolutional
* Input size: 13 x 13 x 384
* Output size: 13 x 13 x 256
* Kernel size: 3 x 3
* Stride: 1
* Padding: 1
* Number of filters: 256
* Parameters: (3 x 3 x 384 x 256) + 256 = 884,992
* Activation: ReLU

## Layer 8 (Pool3)
* Layer type: Max Pooling
* Input size: 13 x 13 x 256
* Output size: 6 x 6 x 256
* Kernel size: 3 x 3
* Stride: 2
* Parameters: 0

## Layer 9 (FC1)
* Layer type: Fully Connected
* Input size: 6 x 6 x 256 (9,216)
* Output size: 4,096
* Parameters: (9,216 x 4,096) + 4,096 = 37,752,832
* Activation: ReLU
* Additional: Dropout (0.5)

## Layer 10 (FC2)
* Layer type: Fully Connected
* Input size: 4,096
* Output size: 4,096
* Parameters: (4,096 x 4,096) + 4,096 = 16,781,312
* Activation: ReLU
* Additional: Dropout (0.5)

## Layer 11 (FC3)
* Layer type: Fully Connected
* Input size: 4,096
* Output size: 1,000
* Parameters: (4,096 x 1,000) + 1,000 = 4,097,000
* Activation: Softmax

## Output
* Size: 1,000
* Represents: Probability distribution over 1,000 ImageNet classes

## Summary
* Total layers: 11 (5 Convolutional, 3 Max Pooling, 3 Fully Connected)
* Total parameters: ~62.4 million
* Key features:
  * ReLU activations throughout
  * Local Response Normalization in early layers
  * Dropout in fully connected layers
  * Split architecture (originally for dual GPU training)
  * First major CNN to achieve significant results on ImageNet

# ZF-Net

## Input
* Input image size: 224x224x3 (RGB image)

## Layer 1
* Type: Convolutional Layer
* Input size: 224x224x3
* Kernel size: 7x7
* Stride: 2
* Number of filters: 96
* Output size: 110x110x96
* Followed by Max Pooling:
  * Pool size: 3x3
  * Stride: 2
  * Output after pooling: 55x55x96

## Layer 2
* Type: Convolutional Layer
* Input size: 55x55x96
* Kernel size: 3x3
* Stride: 2
* Number of filters: 256
* Output size: 26x26x256
* Followed by Max Pooling:
  * Pool size: 3x3
  * Stride: 2
  * Output after pooling: 13x13x256

## Layer 3
* Type: Convolutional Layer
* Input size: 13x13x256
* Kernel size: 3x3
* Stride: 1
* Number of filters: 384
* Padding: Same
* Output size: 13x13x384

## Layer 4
* Type: Convolutional Layer
* Input size: 13x13x384
* Kernel size: 3x3
* Stride: 1
* Number of filters: 384
* Padding: Same
* Output size: 13x13x384

## Layer 5
* Type: Convolutional Layer
* Input size: 13x13x384
* Kernel size: 3x3
* Stride: 1
* Number of filters: 256
* Padding: Same
* Output size: 13x13x256
* Followed by Max Pooling:
  * Pool size: 3x3
  * Stride: 2
  * Output after pooling: 6x6x256

## Layer 6
* Type: Fully Connected Layer
* Input size: 6x6x256 (flattened)
* Number of neurons: 4096
* Activation: ReLU

## Layer 7
* Type: Fully Connected Layer
* Input size: 4096
* Number of neurons: 4096
* Activation: ReLU

## Output
* Type: Fully Connected Layer
* Input size: 4096
* Number of neurons: 1000
* Activation: Softmax

## Summary
* Total number of layers: 8 (5 convolutional + 3 fully connected)
* Notable features:
  * Decreasing spatial dimensions through stride and pooling
  * Increasing number of filters in early layers (96 → 256 → 384)
  * Three max pooling layers for dimensionality reduction
  * Two large fully connected layers (4096 neurons each)
  * Final softmax layer for classification
* Architecture follows typical CNN pattern of convolution-pooling layers followed by dense layers
* Designed for image classification with 1000 categories


# VGGNet


## Input Layer
* Dimensions: 224×224×3 (Height × Width × Channels)
* Memory footprint: 150K parameters
* Format: RGB image input

## Layer 1 - First Convolutional Block (Part 1)
* Type: Convolutional Layer
* Input size: 224×224×3
* Output size: 224×224×64
* Kernel size: 3×3
* Number of filters: 64
* Parameters: 1,728 ((3×3×3)×64)
* Memory: 3.2M
* Assumed padding: 1 (same padding)
* Assumed stride: 1

## Layer 2 - First Convolutional Block (Part 2)
* Type: Convolutional Layer
* Input size: 224×224×64
* Output size: 224×224×64
* Kernel size: 3×3
* Number of filters: 64
* Parameters: 36,864 ((3×3×64)×64)
* Memory: 3.2M
* Assumed padding: 1
* Assumed stride: 1

## Layer 3 - First Max Pooling
* Type: Max Pooling
* Input size: 224×224×64
* Output size: 112×112×64
* Kernel size: 2×2
* Stride: 2
* Parameters: 0
* Memory: 800K

## Layer 4 - Second Convolutional Block (Part 1)
* Type: Convolutional Layer
* Input size: 112×112×64
* Output size: 112×112×128
* Kernel size: 3×3
* Number of filters: 128
* Parameters: 73,728 ((3×3×64)×128)
* Memory: 1.6M
* Assumed padding: 1
* Assumed stride: 1

## Layer 5 - Second Convolutional Block (Part 2)
* Type: Convolutional Layer
* Input size: 112×112×128
* Output size: 112×112×128
* Kernel size: 3×3
* Number of filters: 128
* Parameters: 147,456 ((3×3×128)×128)
* Memory: 1.6M
* Assumed padding: 1
* Assumed stride: 1

## Layer 6 - Second Max Pooling
* Type: Max Pooling
* Input size: 112×112×128
* Output size: 56×56×128
* Kernel size: 2×2
* Stride: 2
* Parameters: 0
* Memory: 400K

## Layer 7 - Third Convolutional Block (Part 1)
* Type: Convolutional Layer
* Input size: 56×56×128
* Output size: 56×56×256
* Kernel size: 3×3
* Number of filters: 256
* Parameters: 294,912 ((3×3×128)×256)
* Memory: 800K
* Assumed padding: 1
* Assumed stride: 1

## Layer 8 - Third Convolutional Block (Part 2)
* Type: Convolutional Layer
* Input size: 56×56×256
* Output size: 56×56×256
* Kernel size: 3×3
* Number of filters: 256
* Parameters: 589,824 ((3×3×256)×256)
* Memory: 800K
* Assumed padding: 1
* Assumed stride: 1

## Layer 9 - Third Convolutional Block (Part 3)
* Type: Convolutional Layer
* Input size: 56×56×256
* Output size: 56×56×256
* Kernel size: 3×3
* Number of filters: 256
* Parameters: 589,824 ((3×3×256)×256)
* Memory: 800K
* Assumed padding: 1
* Assumed stride: 1

## Layer 10 - Third Max Pooling
* Type: Max Pooling
* Input size: 56×56×256
* Output size: 28×28×256
* Kernel size: 2×2
* Stride: 2
* Parameters: 0
* Memory: 200K

## Layer 11 - Fourth Convolutional Block (Part 1)
* Type: Convolutional Layer
* Input size: 28×28×256
* Output size: 28×28×512
* Kernel size: 3×3
* Number of filters: 512
* Parameters: 1,179,648 ((3×3×256)×512)
* Memory: 400K
* Assumed padding: 1
* Assumed stride: 1

## Layer 12 - Fourth Convolutional Block (Part 2)
* Type: Convolutional Layer
* Input size: 28×28×512
* Output size: 28×28×512
* Kernel size: 3×3
* Number of filters: 512
* Parameters: 2,359,296 ((3×3×512)×512)
* Memory: 400K
* Assumed padding: 1
* Assumed stride: 1

## Layer 13 - Fourth Convolutional Block (Part 3)
* Type: Convolutional Layer
* Input size: 28×28×512
* Output size: 28×28×512
* Kernel size: 3×3
* Number of filters: 512
* Parameters: 2,359,296 ((3×3×512)×512)
* Memory: 400K
* Assumed padding: 1
* Assumed stride: 1

## Layer 14 - Fourth Max Pooling
* Type: Max Pooling
* Input size: 28×28×512
* Output size: 14×14×512
* Kernel size: 2×2
* Stride: 2
* Parameters: 0
* Memory: 100K

## Layer 15 - Fifth Convolutional Block (Part 1)
* Type: Convolutional Layer
* Input size: 14×14×512
* Output size: 14×14×512
* Kernel size: 3×3
* Number of filters: 512
* Parameters: 2,359,296 ((3×3×512)×512)
* Memory: 100K
* Assumed padding: 1
* Assumed stride: 1

## Layer 16 - Fifth Convolutional Block (Part 2)
* Type: Convolutional Layer
* Input size: 14×14×512
* Output size: 14×14×512
* Kernel size: 3×3
* Number of filters: 512
* Parameters: 2,359,296 ((3×3×512)×512)
* Memory: 100K
* Assumed padding: 1
* Assumed stride: 1

## Layer 17 - Fifth Convolutional Block (Part 3)
* Type: Convolutional Layer
* Input size: 14×14×512
* Output size: 14×14×512
* Kernel size: 3×3
* Number of filters: 512
* Parameters: 2,359,296 ((3×3×512)×512)
* Memory: 100K
* Assumed padding: 1
* Assumed stride: 1

## Layer 18 - Fifth Max Pooling
* Type: Max Pooling
* Input size: 14×14×512
* Output size: 7×7×512
* Kernel size: 2×2
* Stride: 2
* Parameters: 0
* Memory: 25K

## Layer 19 - First Fully Connected
* Type: Fully Connected Layer
* Input size: 7×7×512
* Output size: 1×1×4096
* Parameters: 102,760,448 (7×7×512×4096)
* Memory: 4096

## Layer 20 - Second Fully Connected
* Type: Fully Connected Layer
* Input size: 1×1×4096
* Output size: 1×1×4096
* Parameters: 16,777,216 (4096×4096)
* Memory: 4096

## Layer 21 - Third Fully Connected (Output)
* Type: Fully Connected Layer
* Input size: 1×1×4096
* Output size: 1×1×1000
* Parameters: 4,096,000 (4096×1000)
* Memory: 1000

# Summary
* Total number of layers: 21 (13 convolutional layers, 5 max pooling layers, 3 fully connected layers)
* Total parameters: ~138.4M
* Network depth: Very deep architecture with 16 weight layers
* Architecture pattern: Repeated blocks of conv layers followed by max pooling
* Notable features:
  * All convolutional layers use 3×3 kernels
  * All max pooling layers use 2×2 windows with stride 2
  * Progressive increase in number of filters (64→128→256→512)
  * Three fully connected layers at the end
  * Final output represents 1000 class probabilities (ImageNet classification)

# GoogLeNet

## Input
* Input size: 224 × 224 × 3 RGB image
* Preprocessing: Scale to [0,1] and normalize

## Layer 1 - Stem Network
* Type: Convolutional
* Kernel size: 7×7
* Stride: 2
* Filters: 64
* Input size: 224×224×3
* Output size: 112×112×64
* Padding: 3
* Activation: ReLU

## Layer 2 - Max Pooling
* Type: Max Pooling
* Kernel size: 3×3
* Stride: 2
* Input size: 112×112×64
* Output size: 56×56×64
* Padding: 1

## Layer 3 - Local Response Normalization
* Type: LRN
* Input size: 56×56×64
* Output size: 56×56×64

## Layer 4 - Convolutional
* Type: Convolutional
* Kernel size: 1×1
* Filters: 64
* Input size: 56×56×64
* Output size: 56×56×64
* Activation: ReLU

## Layer 5 - Convolutional
* Type: Convolutional
* Kernel size: 3×3
* Filters: 192
* Input size: 56×56×64
* Output size: 56×56×192
* Padding: 1
* Activation: ReLU

## Layer 6 - Local Response Normalization
* Type: LRN
* Input size: 56×56×192
* Output size: 56×56×192

## Layer 7 - Max Pooling
* Type: Max Pooling
* Kernel size: 3×3
* Stride: 2
* Input size: 56×56×192
* Output size: 28×28×192

## Inception Modules (3a-5b)
* 9 Inception modules in total
* Each module contains parallel paths:
  1. 1×1 convolutions
  2. 1×1 conv → 3×3 conv
  3. 1×1 conv → 5×5 conv
  4. 3×3 max pool → 1×1 conv

## Auxiliary Classifiers
* Two auxiliary classifiers after Inception 3b and 4d
* Each includes:
  * Average pooling
  * 1×1 convolution
  * Fully connected layers
  * Softmax output

## Final Layers
* Average Pooling: 7×7
* Dropout (40%)
* Linear layer: 1024 units
* Softmax: 1000 classes

## Output
* Size: 1×1×1000
* Softmax activation
* 1000 class probabilities

## Summary
* Total layers: 22 layers (27 including pooling)
* Parameters: ~7 million
* Key features:
  * Inception modules for efficient computation
  * Auxiliary classifiers for better gradient flow
  * Multiple scales of feature extraction
  * Network in Network (1×1 convolutions)
* Notable characteristics:
  * Reduced parameters compared to previous architectures
  * Efficient inception modules
  * Deep network with gradient support through auxiliary classifiers
  * Winner of ILSVRC 2014 with 6.67% top-5 error

# ResNet

## Input
* Input size: 224 x 224 x 3 (RGB image)
* Input preprocessing: Image normalization

## Layer 1 - Initial Convolution
* Layer type: Convolutional
* Input size: 224 x 224 x 3
* Output size: 112 x 112 x 64
* Kernel size: 7 x 7
* Stride: 2
* Padding: 3
* Number of parameters: 9,408 (7 × 7 × 3 × 64)
* Activation: ReLU

## Layer 2 - Max Pooling
* Layer type: Max Pooling
* Input size: 112 x 112 x 64
* Output size: 56 x 56 x 64
* Kernel size: 3 x 3
* Stride: 2
* Padding: 1

## Layers 3-7 - Conv2_x Block (3 Residual Blocks)
* Layer type: 3 Bottleneck Residual Blocks
* Input size: 56 x 56 x 64
* Output size: 56 x 56 x 256
* Each block contains:
  - 1x1 convolution (64 filters)
  - 3x3 convolution (64 filters)
  - 1x1 convolution (256 filters)
* Number of parameters per block: ~70K
* Activation: ReLU after each block

## Layers 8-13 - Conv3_x Block (4 Residual Blocks)
* Layer type: 4 Bottleneck Residual Blocks
* Input size: 56 x 56 x 256
* Output size: 28 x 28 x 512
* Stride 2 in first block
* Similar bottleneck structure as previous blocks
* Number of parameters per block: ~380K
* Activation: ReLU after each block

## Layers 14-22 - Conv4_x Block (6 Residual Blocks)
* Layer type: 6 Bottleneck Residual Blocks
* Input size: 28 x 28 x 512
* Output size: 14 x 14 x 1024
* Stride 2 in first block
* Number of parameters per block: ~850K
* Activation: ReLU after each block

## Layers 23-28 - Conv5_x Block (3 Residual Blocks)
* Layer type: 3 Bottleneck Residual Blocks
* Input size: 14 x 14 x 1024
* Output size: 7 x 7 x 2048
* Stride 2 in first block
* Number of parameters per block: ~3.8M
* Activation: ReLU after each block

## Layer 29 - Average Pooling
* Layer type: Global Average Pooling
* Input size: 7 x 7 x 2048
* Output size: 1 x 1 x 2048

## Layer 30 - Fully Connected
* Layer type: Fully Connected
* Input size: 2048
* Output size: 1000 (for ImageNet classification)
* Number of parameters: 2,048,000

## Output
* Size: 1000-dimensional vector
* Activation: Softmax
* Represents class probabilities for 1000 categories

## Summary
* Total number of layers: 50 (counting all convolutional layers)
* Total parameters: ~25.5 million
* Key features:
  - Skip connections to address vanishing gradient
  - Bottleneck design for efficiency
  - Batch normalization after each convolution
  - Deep architecture with residual learning
* Architecture highlights:
  - Progressive reduction in spatial dimensions
  - Increase in feature channels
  - Heavy use of 1x1 convolutions for dimension reduction