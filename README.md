# Unhandled Exception in Asynchronous Dart Code

This repository demonstrates a common error in Dart: improper exception handling in asynchronous operations. The `fetchData` function makes a network request and attempts to handle exceptions. However, the `catch` block only prints the error to the console and does not take any corrective actions or provide feedback to the user.

## Bug

The bug lies in the `catch` block of the `fetchData` function.  It catches exceptions during the network request, but it doesn't handle them effectively.  The application might continue to run in an unexpected state. Ideally, it should provide feedback to the user, retry the request, or implement some fallback mechanism.

## Solution

The solution improves exception handling by providing feedback to the user and implementing a retry mechanism. It also includes more robust error handling in the JSON decoding step.
