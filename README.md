# Lung-cancer-classification-using-FPGA

# Logistic Regression Model Implementation and FPGA Acceleration

This project entails the development of a logistic regression model, initially through software implementation and subsequently via FPGA hardware acceleration, followed by a performance comparison in terms of time and accuracy. The software phase involves MATLAB, while FPGA implementation employs the ISE software for hardware design. Various components are defined within the ISE environment to structure the hardware model. The model's evaluation employs a specific dataset, which will be detailed further.

## Introduction
Logistic regression serves as a fundamental machine learning and artificial intelligence model for classification tasks. In binary classification, it discerns whether an input belongs to a particular category or not. The chosen dataset for this project centers around the examination of lung cancer, including attributes such as individuals' age, daily cigarette consumption, and their lung cancer diagnosis.

## FPGA Implementation and Parallel Processing
The crux of this project lies in the FPGA implementation phase using ISE software. FPGA technology allows for parallel processing, which addresses the computational challenges associated with the logistic regression model. By executing computations simultaneously on FPGA, we seek to overcome the time-consuming nature of microprocessor-based calculations, thereby enhancing the overall speed and efficiency of the model.

This project offers the opportunity to delve into the realm of hardware-accelerated machine learning, specifically in the context of logistic regression. By leveraging FPGA and the capabilities of ISE software, we aim to not only improve the efficiency of the model but also explore the potential for broader applications in real-time classification and decision-making systems.
