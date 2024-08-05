#import "@preview/cetz:0.2.2": *

= Assignment-1

== UNIT-1

=== 1.	Differentiate between deep learning and machine learning.  05 Marks
=== 2.	What is deep learning? Explain with suitable example.  05 Marks
=== 3.	Explain the concept of a Perceptron with a neat diagram. 
=== 4.	Explain Neural Representation of AND, OR, and NOT Logic Gates with suitable example.
=== 5.	Discuss the Perceptron training rule with perceptron algorithm.
=== 6.	Explain Multi-layer perceptron with suitable diagram.

= Assignment-2
== UNIT-3

=== 1.	What is the role of the Activation functions in Neural Networks? Explain Non-linear Activation Functions used in Neural Networks.
=== 2.	Explain Bias and Variance in detail. 
=== 3.	What is mean by overfitting and underfitting? How to avoid overfitting ? 
=== 4.	What is Regularization? Explain different Regularization Techniques.
=== 5.	Differentiate between L1 and L2 Regularization Techniques.
=== 6.	Explain Dropout Regularization Techniques in Deep Learning.

#pagebreak()

=== 1. Differentiate between deep learning and machine learning. (05 Marks)

// Deep learning and machine learning are both subfields of artificial intelligence, but they have some key differences:

// 1. Architecture:
//    - Machine Learning: Uses algorithms to parse data, learn from it, and make informed decisions based on what it has learned. It often requires more human intervention in feature extraction and selection.
//    - Deep Learning: Uses artificial neural networks with multiple layers (hence "deep") to progressively extract higher-level features from raw input. It can automatically discover the representations needed for feature detection or classification.

// 2. Data Dependency:
//    - Machine Learning: Can work with smaller datasets and often requires structured data.
//    - Deep Learning: Typically requires large amounts of data to perform well and can work effectively with unstructured data.

// 3. Feature Engineering:
//    - Machine Learning: Often requires manual feature extraction and careful engineering of feature sets.
//    - Deep Learning: Performs automatic feature extraction, learning representations of data that emphasize aspects useful for discrimination.

// 4. Hardware Requirements:
//    - Machine Learning: Can work on lower-end machines and doesn't always require significant computational resources.
//    - Deep Learning: Often requires high-performance GPUs for efficient training of complex models.

// 5. Training Time:
//    - Machine Learning: Generally takes less time to train compared to deep learning models.
//    - Deep Learning: Requires longer training times due to the complexity of the models and the amount of data processed.

// 6. Interpretability:
//    - Machine Learning: Many algorithms (like decision trees or linear regression) are more interpretable and easier to understand.
//    - Deep Learning: Often considered a "black box" due to the complexity of the models, making it harder to interpret how decisions are made.

// 7. Problem Solving Approach:
//    - Machine Learning: Better suited for problems where understanding the factors influencing the outcome is important.
//    - Deep Learning: Excels in solving complex problems like image and speech recognition, natural language processing, where the underlying patterns are difficult to express in a traditional algorithm.

// In essence, deep learning can be seen as a subset of machine learning that focuses on using neural networks with multiple layers to learn from large amounts of data, often outperforming traditional machine learning algorithms in complex tasks but requiring more computational resources and data.

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [*Aspect*], [*Machine Learning*], [*Deep Learning*],
  
  [1. Architecture],
  [Uses algorithms to parse data, learn from it, and make informed decisions. Requires more human intervention in feature extraction.],
  [Uses artificial neural networks with multiple layers to progressively extract higher-level features from raw input.],
  
  [2. Data Dependency],
  [Can work with smaller datasets. Often requires structured data.],
  [Typically requires large amounts of data. Can work effectively with unstructured data.],
  
  [3. Feature Engineering],
  [Often requires manual feature extraction and careful engineering of feature sets.],
  [Performs automatic feature extraction, learning representations of data.],
  
  [4. Hardware Requirements],
  [Can work on lower-end machines. Doesn't always require significant computational resources.],
  [Often requires high-performance GPUs for efficient training of complex models.],
  
  [5. Training Time],
  [Generally takes less time to train.],
  [Requires longer training times due to model complexity and data volume.],
  
  [6. Interpretability],
  [Many algorithms are more interpretable and easier to understand.],
  [Often considered a "black box" due to model complexity.],
  
  [7. Problem Solving Approach],
  [Better suited for problems where understanding influencing factors is important.],
  [Excels in solving complex problems like image and speech recognition, NLP.],
  
  [8. Scalability],
  [May face challenges in scaling to very large datasets.],
  [Scales well with increasing amounts of data, showing continued improvement.],
  
  [9. Handling of Non-linear Relationships],
  [Some algorithms struggle with highly non-linear relationships.],
  [Excels at capturing and modeling complex, non-linear relationships in data.],
  
  [10. Transfer Learning],
  [Limited ability to transfer knowledge between tasks.],
  [Supports effective transfer learning, allowing models to be fine-tuned for new tasks.],
  
  [11. Computational Complexity],
  [$O(n^2)$ to $O(n^3)$ for many algorithms, where $n$ is the number of training examples.],
  [Can be $O(n)$ for some architectures, but often has high constant factors.],
  
  [12. Model Updates],
  [Often requires retraining from scratch when new data becomes available.],
  [Supports incremental learning and online learning in many cases.],
  
  [13. Ensemble Methods],
  [Commonly uses ensemble methods (e.g., Random Forests, Gradient Boosting).],
  [Ensembles are less common but can be used (e.g., ensemble of CNNs).],
  
  [14. Handling Multimodal Data],
  [Typically requires separate models for different data types.],
  [Can naturally integrate multiple data modalities in a single model.],
  
  [15. Regularization Techniques],
  [Uses methods like L1/L2 regularization, pruning for decision trees.],
  [Uses specialized techniques like dropout, batch normalization, and weight decay.]
)

=== 2. What is deep learning? Explain with suitable example. (05 Marks)

Deep learning is a subset of machine learning that uses artificial neural networks with multiple layers (deep neural networks) to model and process complex patterns in large amounts of data. It's inspired by the structure and function of the human brain, particularly the interconnecting of many neurons.

Key characteristics of deep learning include:

1. Hierarchical Feature Learning: Deep learning models learn to represent data with increasing levels of abstraction in each layer.
2. End-to-End Learning: These models can learn directly from raw data without the need for manual feature engineering.
3. High Capacity: Deep neural networks can have millions of parameters, allowing them to capture intricate patterns in data.
4. Automatic Feature Extraction: The model learns to identify relevant features on its own.

Example: Image Recognition

Let's consider an example of a deep learning model used for image recognition, specifically for identifying different breeds of dogs in photographs.

#figure(image("assignment-1-images/1.svg"))

This diagram represents a typical Convolutional Neural Network (CNN) used for image recognition tasks like dog breed classification. Here's how it works:

1. Input Layer: The process begins with an input image of a dog.

2. Convolutional Layers: These layers apply filters to detect features like edges, textures, and shapes in the image. Early layers might detect simple features like edges, while deeper layers can recognize more complex patterns like ears or tails.

3. Pooling Layers: These reduce the spatial dimensions of the processed data, retaining the most important information while reducing computational load.

4. Fully Connected Layers: These layers take the high-level features identified by the convolutional layers and combine them to make predictions.

5. Output Layer: This final layer provides the classification result, identifying the breed of the dog in the image.

The deep learning model learns to recognize increasingly complex features at each layer. For instance:
- First layer: Detect edges and simple shapes
- Middle layers: Identify dog-specific features like fur patterns, ear shapes, or snout types
- Final layers: Combine these features to classify the specific breed

During training, the model is shown thousands of labeled dog images. It adjusts its internal parameters to improve its accuracy in identifying breeds. Once trained, it can classify new, unseen images of dogs into breeds with high accuracy.

This example demonstrates key aspects of deep learning:
1. Hierarchical learning: From simple features to complex concepts
2. Automatic feature extraction: The model learns relevant features without human intervention
3. High capacity: Able to learn complex patterns from large datasets
4. End-to-end learning: Direct learning from raw pixel data to final classification

=== 3. Explain the concept of a Perceptron with a neat diagram.

A perceptron is the simplest form of a neural network, designed to perform binary classification. It's a fundamental building block in neural networks and serves as a good introduction to understanding how artificial neurons work.


#figure(image("assignment-1-images/2.svg"))

Explanation of the Perceptron diagram:

1. Inputs (x₁, x₂, x₃): These are the input features. In a real-world scenario, these could represent various attributes of the data we're trying to classify.

2. Weights (w₁, w₂, w₃): Each input is associated with a weight. These weights represent the importance of each input in making the final decision.

3. Summation (Σ): This component sums up the product of each input and its corresponding weight. Mathematically, it calculates $Σ(x_i \* w_i)$.

4. Bias: Although not explicitly shown in the diagram, a bias term is often added to the sum. It allows the perceptron to shift the decision boundary.

5. Activation Function: This is applied to the sum. In the simplest form, it could be a step function that outputs 1 if the sum is above a threshold and 0 otherwise.

6. Output: The final output of the perceptron, typically 0 or 1 for binary classification.

How a Perceptron works:

1. It receives input values (x₁, x₂, x₃).
2. Each input is multiplied by its corresponding weight (w₁, w₂, w₃).
3. These weighted inputs are summed together, along with a bias term.
4. The sum is passed through an activation function.
5. Based on the activation function's output, the perceptron makes a decision (typically a binary classification).

The learning process of a perceptron involves adjusting the weights and bias to minimize the error between predicted and actual outputs for a given set of training data.

Limitations:
While perceptrons are effective for linearly separable problems, they cannot solve more complex, non-linear problems. This limitation led to the development of multi-layer perceptrons and more advanced neural network architectures.

=== 4. Explain Neural Representation of AND, OR, and NOT Logic Gates with suitable example.

Neural networks can be used to represent basic logic gates. Here, we'll explore how perceptrons can model AND, OR, and NOT gates. These examples demonstrate how simple neural networks can perform fundamental logical operations.

1. AND Gate

The AND gate outputs 1 only when both inputs are 1.

Truth Table:
```
x1 | x2 | Output
0  | 0  |   0
0  | 1  |   0
1  | 0  |   0
1  | 1  |   1
```

Neural Representation:
- We need two inputs (x1 and x2) and one output neuron.
- Let's use weights w1 = 1, w2 = 1, and bias = -1.5.
- The activation function will be a step function: if sum > 0, output 1; else output 0.



#figure(image("assignment-1-images/3.svg"))

Example calculation:
- For inputs (1, 1): 1*1 + 1*1 - 1.5 = 0.5 > 0, so output is 1
- For inputs (1, 0): 1*1 + 0*1 - 1.5 = -0.5 < 0, so output is 0

1. OR Gate

The OR gate outputs 1 if at least one of the inputs is 1.

Truth Table:
```
x1 | x2 | Output
0  | 0  |   0
0  | 1  |   1
1  | 0  |   1
1  | 1  |   1
```

Neural Representation:
- We need two inputs (x1 and x2) and one output neuron.
- Let's use weights w1 = 1, w2 = 1, and bias = -0.5.
- The activation function will be a step function: if sum > 0, output 1; else output 0.


#figure(image("assignment-1-images/4.svg"))

Example calculation:
- For inputs (1, 0): 1*1 + 0*1 - 0.5 = 0.5 > 0, so output is 1
- For inputs (0, 0): 0*1 + 0*1 - 0.5 = -0.5 < 0, so output is 0

1. NOT Gate

The NOT gate (or inverter) outputs the opposite of its input.

Truth Table:
```
x | Output
0 |   1
1 |   0
```

Neural Representation:
- We need only one input (x) and one output neuron.
- Let's use weight w = -1 and bias = 0.5.
- The activation function will be a step function: if sum > 0, output 1; else output 0.



#figure(image("assignment-1-images/5.svg"))

Example calculation:
- For input 0: 0\*(-1) + 0.5 = 0.5 > 0, so output is 1
- For input 1: 1\*(-1) + 0.5 = -0.5 < 0, so output is 0

These examples demonstrate how simple neural networks can model basic logical operations:

1. By adjusting weights and biases, we can create different decision boundaries.
2. The AND gate requires both inputs to be high to activate, hence the higher threshold (bias of -1.5).
3. The OR gate activates with any input being high, so it has a lower threshold (bias of -0.5).
4. The NOT gate uses a negative weight to invert the input.

Understanding these basic neural representations of logic gates is crucial because more complex neural networks essentially combine these fundamental operations to perform intricate tasks. This illustrates how neural networks can learn to approximate any function, given enough neurons and appropriate training.

=== 5. Discuss the Perceptron training rule with perceptron algorithm.

The Perceptron training rule, also known as the Perceptron learning algorithm, is a simple yet powerful method for training a single-layer perceptron. It's an iterative algorithm that adjusts the weights of the perceptron to minimize classification errors.

Perceptron Algorithm:

1. Initialize:
   - Set initial weights (w) and bias (b) to small random values or zeros.
   - Define a learning rate η (eta), typically a small positive value like 0.1.

2. For each training example (x, y), where x is the input vector and y is the target output (0 or 1):
   a. Calculate the predicted output:
      ŷ = 1 if w·x + b > 0, else 0
      (where w·x is the dot product of weights and inputs)
   
   b. Update weights and bias:
      If ŷ ≠ y (prediction is incorrect):
         w = w + η(y - ŷ)x
         b = b + η(y - ŷ)

3. Repeat step 2 for a fixed number of epochs or until convergence (no misclassifications).

Key Components: 

4. Prediction Step:
   The perceptron makes a prediction based on the current weights and bias. It calculates the weighted sum of inputs (w·x + b) and applies the step activation function.

5. Error Calculation:
   The error is the difference between the target output (y) and the predicted output (ŷ). This error term (y - ŷ) will be either 1, 0, or -1.

6. Weight Update Rule:
   w = w + η(y - ŷ)x
   - If the prediction is correct (y = ŷ), no update occurs.
   - If y = 1 and ŷ = 0 (false negative), weights increase.
   - If y = 0 and ŷ = 1 (false positive), weights decrease.

7. Bias Update Rule:
   b = b + η(y - ŷ)
   The bias is updated in a similar manner to the weights.

8. Learning Rate (η):
   Controls the size of weight updates. A smaller learning rate leads to slower learning but can result in more precise convergence.

Example:
Let's consider a simple 2D classification problem to illustrate the perceptron learning algorithm:


``` Insert a figure demonstrating the perceptron learning algorithm with a 2D classification example.```

// #figure(image("assignment-1-images/6.svg"))

In this visualization:
- Blue points represent one class (y = 0)
- Red points represent another class (y = 1)
- The gray dashed line is the initial decision boundary
- The green solid line is the final decision boundary after training

Algorithm steps for this example:

1. Initialize weights and bias (w1, w2, b) randomly.
2. For each point (x1, x2, y):
   a. Calculate ŷ = step(w1*x1 + w2*x2 + b)
   b. If ŷ ≠ y:
      w1 = w1 + η(y - ŷ)x1
      w2 = w2 + η(y - ŷ)x2
      b = b + η(y - ŷ)
3. Repeat until all points are correctly classified or max iterations reached.

Key aspects of the Perceptron Learning Algorithm:

1. Convergence: If the data is linearly separable, the algorithm is guaranteed to converge to a solution in a finite number of steps.

2. Linear Separability: The perceptron can only learn linearly separable functions. For non-linearly separable problems, it will not converge.

3. Online Learning: The algorithm updates weights after each training example, making it suitable for online learning scenarios.

4. Simplicity: It's easy to implement and understand, making it a good starting point for understanding neural network training.

5. Limitations: It can only learn linear decision boundaries and is sensitive to the order of training examples.

Understanding the perceptron learning algorithm provides a foundation for grasping more complex neural network training algorithms, like backpropagation used in multi-layer networks.

=== 6. Explain Multi-layer perceptron with suitable diagram.

A Multi-Layer Perceptron (MLP) is a type of feedforward artificial neural network consisting of at least three layers of nodes: an input layer, one or more hidden layers, and an output layer. MLPs are capable of learning non-linear relationships between inputs and outputs, overcoming the limitations of single-layer perceptrons.

Key Components of an MLP:

1. Input Layer: Receives the initial data the network will process.
2. Hidden Layer(s): Perform computations and transfer information from the input to output layers.
3. Output Layer: Produces the final network predictions.
4. Neurons: The basic units in each layer that process information.
5. Weights and Biases: Adjustable parameters that the network learns during training.
6. Activation Functions: Non-linear functions applied to the weighted sum of inputs in each neuron.

#figure(image("assignment-1-images/7.svg"))

Explanation of the MLP Diagram:

1. Input Layer: 
   - Contains three nodes (x₁, x₂, x₃) representing the input features.
   - These nodes don't perform any computation; they just pass the input data to the next layer.

2. Hidden Layer:
   - Contains three nodes (circles in blue).
   - Each node is connected to every node in the input layer.
   - These nodes apply an activation function to the weighted sum of their inputs.

3. Output Layer:
   - Contains two nodes (y₁, y₂) representing the network's predictions.
   - Each output node is connected to every node in the hidden layer.
   - The number of output nodes depends on the specific problem (e.g., binary classification would have one output node).

4. Connections:
   - Represented by lines between nodes.
   - Each connection has an associated weight that is learned during training.

Functioning of an MLP:

1. Forward Propagation:
   a. Input values are fed into the input layer.
   b. For each node in the hidden layer:
      - Calculate the weighted sum of inputs: z = w₁x₁ + w₂x₂ + w₃x₃ + b
      - Apply the activation function: a = f(z)
   c. Repeat step b for the output layer, using the outputs from the hidden layer as inputs.

2. Activation Functions:
   - Common choices include ReLU (Rectified Linear Unit), sigmoid, and tanh.
   - These introduce non-linearity, allowing the network to learn complex patterns.

3. Backpropagation:
   - The error between predicted and actual outputs is calculated.
   - This error is propagated backwards through the network.
   - Weights and biases are adjusted to minimize the error.

4. Training:
   - The forward propagation and backpropagation steps are repeated for many examples.
   - The network gradually improves its predictions by adjusting its weights and biases.

Advantages of MLPs:

1. Non-linear Function Approximation: Can learn complex, non-linear relationships in data.
2. Adaptability: Can be applied to a wide range of problems (classification, regression, etc.).
3. Parallel Processing: Computations within each layer can be parallelized for efficiency.

Limitations:

1. Vanishing/Exploding Gradients: Deep networks can suffer from these issues during training.
2. Overfitting: With many parameters, MLPs can overfit on small datasets.
3. Black Box Nature: The learned representations are often not easily interpretable.

MLPs form the foundation for more complex neural network architectures. Understanding their structure and function is crucial for grasping advanced concepts in deep learning, such as convolutional neural networks (CNNs) and recurrent neural networks (RNNs).

= Assignment 2

=== 1. What is the role of the Activation functions in Neural Networks? Explain Non-linear Activation Functions used in Neural Networks.

Role of Activation Functions:
Activation functions play a crucial role in neural networks by introducing non-linearity into the network's output. Their primary purposes are:

1. Non-linearity: They allow the network to learn complex patterns and relationships in data that are not simply linear.
2. Output Bounding: Many activation functions bound the output to a specific range, which can be useful for certain types of predictions.
3. Differentiability: Most activation functions are differentiable, which is essential for backpropagation during training.
4. Sparsity: Some activation functions (like ReLU) can induce sparsity in the network, which can be beneficial for feature selection.

Non-linear Activation Functions:

1. Sigmoid (Logistic) Function:
   - Formula: σ(x) = 1 / (1 + e^(-x))
   - Output Range: (0, 1)
   - Properties:
     - Smooth gradient, preventing "jumps" in output values
     - Clear prediction for binary classification problems
   - Limitations:
     - Suffers from vanishing gradient problem for very high or low input values
     - Outputs are not zero-centered



#figure(image("assignment-1-images/8.svg"))

2. Hyperbolic Tangent (tanh) Function:
   - Formula: tanh(x) = (e^x - e^(-x)) / (e^x + e^(-x))
   - Output Range: (-1, 1)
   - Properties:
     - Zero-centered, making it easier for the model to learn
     - Stronger gradients compared to sigmoid
   - Limitations:
     - Still suffers from vanishing gradient problem for very high or low input values

3. Rectified Linear Unit (ReLU):
   - Formula: f(x) = max(0, x)
   - Output Range: [0, ∞)
   - Properties:
     - Computationally efficient
     - Helps mitigate the vanishing gradient problem
     - Induces sparsity in the network
   - Limitations:
     - "Dying ReLU" problem: neurons can get stuck in a state where they always output 0



#figure(image("assignment-1-images/9.svg"))
4. Leaky ReLU:
   - Formula: f(x) = max(αx, x), where α is a small constant (e.g., 0.01)
   - Output Range: (-∞, ∞)
   - Properties:
     - Addresses the "dying ReLU" problem
     - Allows for small negative values
   - Limitations:
     - The optimal value of α may vary for different problems

5. Exponential Linear Unit (ELU):
   - Formula: f(x) = x if x > 0, α(e^x - 1) if x ≤ 0
   - Output Range: (-α, ∞)
   - Properties:
     - Smooth function, including for negative values
     - Can produce negative outputs, unlike ReLU
   - Limitations:
     - Computationally more expensive than ReLU

6. Softmax:
   - Used for multi-class classification problems
   - Converts a vector of real numbers into a probability distribution
   - Formula: softmax(x_i) = e^(x_i) / Σ(e^(x_j))
   - Properties:
     - Outputs sum to 1, representing probabilities
     - Emphasizes the largest values while suppressing significantly smaller ones

These non-linear activation functions enable neural networks to approximate complex functions and learn intricate patterns in data, which is essential for tasks such as image recognition, natural language processing, and many other machine learning applications.

=== 2. Explain Bias and Variance in detail.

Bias and variance are fundamental concepts in machine learning that help us understand the trade-offs in model performance and generalization. They are two types of errors that can occur in predictive models.

Bias:

Bias is the error introduced by approximating a real-world problem, which may be complex, by a simplified model. It's a measure of how far off in general a model's predictions are from the correct values.

Characteristics of High Bias:
1. Oversimplification: The model makes strong assumptions about the data, potentially missing important patterns.
2. Underfitting: The model performs poorly on both training and test data.
3. High error on training data: Indicates that the model is too simple to capture the underlying patterns.

Examples of High Bias:
- Using a linear model for a non-linear problem
- Using a small neural network for a complex task

Variance:

Variance is the error introduced by the model's sensitivity to small fluctuations in the training set. It measures how much the model's predictions would change if we used a different training dataset.

Characteristics of High Variance:
1. Overfitting: The model performs well on training data but poorly on unseen data.
2. Complexity: The model is too complex and captures noise in the training data.
3. Low error on training data but high error on test data: Indicates that the model doesn't generalize well.

Examples of High Variance:
- Using a high-degree polynomial model with limited data
- Using a very deep neural network with insufficient regularization

Bias-Variance Trade-off:

The bias-variance trade-off is the property of a set of predictive models whereby models with a lower bias in parameter estimation have a higher variance of the parameter estimates across samples, and vice versa.

``` Insert a figure demonstrating the bias-variance trade-off.```

// #figure(image("assignment-1-images/10.svg"))

Explanation of the Bias-Variance Trade-off Diagram:
- The x-axis represents model complexity, increasing from left to right.
- The y-axis represents error, with higher values indicating more error.
- The blue curve shows how bias typically decreases as model complexity increases.
- The red curve shows how variance typically increases as model complexity increases.
- The region of underfitting (high bias) is on the left side of the graph.
- The region of overfitting (high variance) is on the right side of the graph.
- The optimal model complexity is at the point where the sum of bias and variance is minimized.

Balancing Bias and Variance:
1. Model Selection: Choose a model with appropriate complexity for your data.
2. Regularization: Add constraints to the model to prevent overfitting.
3. Cross-Validation: Use techniques like k-fold cross-validation to assess model performance.
4. Ensemble Methods: Combine multiple models to balance bias and variance (e.g., Random Forests).
5. Feature Selection/Engineering: Select or create features that capture important patterns without adding noise.

Understanding and managing the bias-variance trade-off is crucial for developing models that generalize well to unseen data. It helps in choosing the right level of model complexity and applying appropriate techniques to improve model performance.

=== 3. What is meant by overfitting and underfitting? How to avoid overfitting?

Overfitting and underfitting are two fundamental concepts in machine learning that describe how well a model fits the training data and generalizes to new, unseen data.

``` Insert a figure demonstrating overfitting and underfitting```

Overfitting:

Overfitting occurs when a model learns the training data too well, including its noise and fluctuations, rather than learning the underlying pattern. An overfit model performs exceptionally well on the training data but poorly on new, unseen data.

Characteristics of Overfitting:
1. High accuracy on training data, low accuracy on test data
2. Complex model with many parameters
3. Captures noise in the training data
4. Poor generalization to new data



// #figure(image("assignment-1-images/11.svg"))

In this visualization:
- The blue curve represents the true underlying function.
- The red curve represents an overfit model that perfectly fits the training points but deviates significantly from the true function.
- The black dots represent the training data points.

Underfitting:

Underfitting occurs when a model is too simple to capture the underlying pattern in the data. An underfit model performs poorly on both the training data and new, unseen data.

Characteristics of Underfitting:
1. Low accuracy on both training and test data
2. Overly simple model with few parameters
3. Fails to capture important patterns in the data
4. High bias, low variance

How to Avoid Overfitting:

1. Use More Training Data:
   - Larger datasets make it harder for the model to memorize specific instances.
   - More diverse data helps the model learn general patterns.

2. Feature Selection and Engineering:
   - Remove irrelevant or redundant features.
   - Create new features that better represent the underlying patterns.

3. Cross-Validation:
   - Use techniques like k-fold cross-validation to assess model performance on different subsets of the data.

4. Regularization:
   - Add a penalty term to the loss function to discourage complex models.
   - Common techniques include L1 (Lasso) and L2 (Ridge) regularization.

5. Dropout:
   - Randomly "drop out" (i.e., set to zero) a proportion of neurons during training.
   - This prevents the network from relying too heavily on any particular feature.

6. Early Stopping:
   - Monitor performance on a validation set during training.
   - Stop training when performance on the validation set starts to degrade.

7. Ensemble Methods:
   - Combine predictions from multiple models to reduce overfitting.
   - Examples include Random Forests and Gradient Boosting.

8. Simplify the Model:
   - Reduce the number of layers or neurons in a neural network.
   - Use a simpler model architecture.

9. Data Augmentation:
   - For tasks like image classification, create new training examples by applying transformations to existing data.

10. Batch Normalization:
    - Normalize the inputs to each layer, which can have a regularizing effect.

11. Use Appropriate Model for the Data:
    - Ensure the model complexity matches the complexity of the problem.
    - For example, don't use a deep neural network for a simple linear problem.

12. Pruning:
    - Remove unnecessary connections or neurons from a trained neural network.

By applying these techniques, you can help your model generalize better to unseen data, striking a balance between underfitting and overfitting. The key is to find a model that captures the true underlying patterns in the data without memorizing the noise or peculiarities of the training set.


=== 4. What is Regularization?

Regularization is a set of techniques used in machine learning and statistical modeling to prevent overfitting and improve the generalization of models. Overfitting occurs when a model learns the training data too well, including its noise and peculiarities, leading to poor performance on unseen data.

The main idea behind regularization is to add a penalty term to the loss function during the training process. This penalty term discourages the model from learning overly complex patterns by adding a cost to certain parameter values or model structures. As a result, the model is forced to find a balance between fitting the training data well and maintaining simplicity or smoothness.

The general form of a regularized loss function is:

```
L_regularized = L_original + λ * R(θ)
```

Where:
- L_regularized is the new, regularized loss function
- L_original is the original loss function (e.g., mean squared error for regression or cross-entropy for classification)
- λ (lambda) is the regularization strength, a hyperparameter that controls the trade-off between fitting the data and keeping the model simple
- R(θ) is the regularization term, which depends on the model parameters θ

Now, let's explore different regularization techniques:

2. Different Regularization Techniques

a) L1 Regularization (Lasso Regression):

L1 regularization adds the absolute value of the magnitude of coefficients as a penalty term to the loss function. The regularization term is:

```
R(θ) = Σ|θ_i|
```

Key characteristics of L1 regularization:
- It tends to produce sparse models by driving some coefficients to exactly zero
- It performs feature selection implicitly
- It is less sensitive to outliers compared to L2 regularization
- It can handle multicollinearity to some extent

L1 regularization is particularly useful when you suspect that only a subset of features is relevant for prediction.

b) L2 Regularization (Ridge Regression):

L2 regularization adds the squared magnitude of coefficients as a penalty term to the loss function. The regularization term is:

```
R(θ) = Σ(θ_i)^2
```

Key characteristics of L2 regularization:
- It tends to shrink coefficients towards zero, but rarely makes them exactly zero
- It handles multicollinearity well by distributing weights among correlated features
- It is computationally efficient and has a closed-form solution for linear regression
- It is more sensitive to outliers compared to L1 regularization

L2 regularization is often the default choice and works well in many scenarios, especially when you want to keep all features but reduce their impact.

c) Elastic Net Regularization:

Elastic Net combines both L1 and L2 regularization. The regularization term is:

```
R(θ) = α * Σ|θ_i| + (1-α) * Σ(θ_i)^2
```

Where α is a mixing parameter between 0 and 1.

Key characteristics of Elastic Net:
- It balances the benefits of both L1 and L2 regularization
- It can handle situations where the number of features is much larger than the number of samples
- It groups correlated features together
- It's particularly useful when there are multiple features correlated with each other

d) Dropout:

Dropout is a regularization technique primarily used in neural networks. During training, it randomly "drops out" (i.e., sets to zero) a proportion of neurons in each layer.

Key characteristics of Dropout:
- It prevents complex co-adaptations between neurons
- It approximates training a large number of different neural networks and then averaging their predictions
- The dropout rate (proportion of neurons to drop) is a hyperparameter, typically set between 0.2 and 0.5
- During inference, all neurons are used, but their outputs are scaled by the dropout rate

Dropout is very effective in reducing overfitting in deep neural networks and has become a standard technique in many architectures.

e) Early Stopping:

Early stopping is a form of regularization used to prevent overfitting by stopping the training process before the model starts to overfit.

Key characteristics of Early Stopping:
- It monitors the model's performance on a validation set during training
- Training stops when the performance on the validation set starts to degrade
- It's computationally efficient as it doesn't require modifying the objective function
- It can be combined with other regularization techniques

Early stopping is widely used in practice due to its simplicity and effectiveness.

f) Data Augmentation:

Data augmentation is a regularization technique that increases the diversity of the training data by applying various transformations to the existing data.

Key characteristics of Data Augmentation:
- It's particularly useful in computer vision tasks (e.g., image rotations, flips, crops)
- It can also be applied to text data (e.g., synonym replacement, back-translation)
- It helps the model learn invariances and become more robust
- It's especially effective when the amount of training data is limited

Data augmentation is a powerful technique that can significantly improve model generalization, especially in domains where collecting more real data is expensive or impractical.

These regularization techniques can be used individually or in combination, depending on the specific problem, dataset, and model architecture. The choice of regularization method and its strength (λ) are important hyperparameters that often require tuning to achieve optimal performance.

=== 5. Differentiate between L1 and L2 Regularization Techniques:

#table(
  columns: (auto, auto, auto),
  inset: 6pt,
  align: horizon,
  [*Aspect*], [*L1 Regularization (Lasso)*], [*L2 Regularization (Ridge)*],
  [Mathematical Form], [$"Loss" = "Error"(Y, Y_"pred") + λ ∑ |w|$], [$"Loss" = "Error"(Y, Y_"pred") + λ ∑ w^2$],
  [Effect on Coefficients], [Pushes some coefficients to exactly zero], [Shrinks all coefficients towards zero, but rarely to exactly zero],
  [Feature Selection], [Performs automatic feature selection], [Does not perform feature selection],
  [Geometry in Parameter Space], [Diamond-shaped (2D) or octahedron-shaped (higher dimensions) constraint region], [Circular (2D) or hyperspherical (higher dimensions) constraint region],
  [Solution Path], [Piecewise linear; coefficients become zero as $λ$ increases], [Smooth decay towards zero as $λ$ increases],
  [Sparsity of Solution], [Produces sparse models], [Does not produce sparse models],
  [Computational Complexity], [Can be more computationally expensive due to non-differentiability at zero], [Generally easier to optimize due to smooth, differentiable nature],
  [Handling Multicollinearity], [Less effective when features are correlated], [Better at handling correlated features],
  [Preferred Use Case], [When many features are suspected to be irrelevant], [When you want to keep all features but reduce their impact uniformly],
  [Stability of Solutions], [Less stable solutions], [More stable solutions, especially with correlated features]
)

=== 6. Explain Dropout Regularization Techniques in Deep Learning:

Dropout is a powerful regularization technique specifically designed for neural networks to prevent overfitting. It was introduced by Srivastava et al. in 2014 and has since become a standard tool in deep learning.

How Dropout Works:

1. Basic Principle: During training, randomly "drop out" (i.e., set to zero) a proportion of neurons in a layer for each training example.

2. Dropout Rate: The probability of dropping out a neuron, typically set between 0.2 and 0.5.

3. Training Phase:
   - For each training example, create a "thinned" network by randomly dropping out neurons.
   - Forward and backward passes are performed on this thinned network.
   - Weights are updated only for the neurons that were kept.

4. Inference Phase:
   - No neurons are dropped out.
   - Instead, the weights are scaled down by a factor equal to the dropout rate to account for the full network being active.

Key Aspects of Dropout:

1. Prevention of Co-adaptation: By randomly dropping neurons, dropout prevents complex co-adaptations where a neuron can only be useful in the context of specific other neurons.

2. Ensemble Effect: Dropout can be seen as training an ensemble of sub-networks. Each training example uses a different thinned network, effectively creating many different network architectures.

3. Reduced Overfitting: By preventing complex co-adaptations on training data, dropout reduces overfitting and improves generalization.

4. Noise Injection: Dropout can be viewed as a way of adding noise to the network, which can improve robustness.

5. Implicit Bagging: The ensemble effect of dropout is similar to bagging in traditional machine learning, where multiple models are trained on different subsets of the data.

Implementation Considerations:

1. Dropout Rate: Typically 0.5 for hidden layers and 0.2 for input layers. These are hyperparameters that can be tuned.

2. Layer Application: Usually applied to fully connected layers, but can also be used with convolutional layers (spatial dropout).

3. Timing: Often applied after the activation function of a layer.

4. Learning Rate: Models with dropout often benefit from increased learning rates and momentum.

5. Weight Constraints: Often used in conjunction with max-norm regularization on the weights.

6. Scheduling: Some implementations gradually increase the dropout rate over training epochs.

Variants and Extensions:

1. Variational Dropout: Uses the same dropout mask for all time steps in recurrent neural networks.

2. Concrete Dropout: Allows learning the dropout rate as part of model training.

3. DropConnect: Generalizes dropout by dropping connections rather than neurons.

4. Zoneout: A regularization technique for recurrent neural networks where hidden units are stochastically forced to maintain their previous values.

#figure(image("assignment-1-images/12.svg"))

Dropout has become a standard technique in deep learning due to its simplicity, effectiveness, and theoretical grounding. It's particularly useful in large networks where overfitting is a significant concern.