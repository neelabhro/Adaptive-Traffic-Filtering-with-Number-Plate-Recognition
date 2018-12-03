# Adaptive Traffic Filtering with Number Plate Recognition
## Neelabhro Roy & Munish Thakral
## INTRODUCTION
The ever growing number of vehicles on roads, has been a problem in India since a long time. To add to the woes, the Traffic Lights here, are pre timed, not taking into account the Ground Zero conditions no matter how many vehicles there are on a particular street. Hence, we plan to design a complete Adaptive Traffic Light Filtering system, which would assess the situations in real time, and allot time to a certain signal in accordance with the number of vehicles waiting before it, using Image Acquisition and Image Processing techniques. Moreover, we plan to inculcate an algorithm in our design, to detect the Number Plates of the defaulting vehicles which jump Red Lights, and store them for future prosecution.

## OBJECTIVES
- Collection of Training Data ( with visible Vehicular congestion) for our Algorithms, which would involve detection of Vehicular Clusters standing before the defaulting marks of Red Light
- Algorithm for Number Plate detection of defaulting vehicles through Image Retargeting.
- Algorithm for efficient and Adaptive Time Allotment to traffic signals in accordance with the vehicular congestion before the signal.

## How Adaptive Traffic Filtering works
The following image processing algorithms are followed, and the resultant image is as shown below:
1. Input Image
2. Grayscale and Binary Conversion
3. Adaptive Background Subtraction
4. Histogram Equalisation
5. Thresholding
6. Edge Detection using Sobel
7. Cleaning up the Image Borders
8. Image Dilation
9. Density Calculations

The background image for clean subtraction is:
![](Number%20Plate/background.jpg)

The Binarized Image after operations is:
![](filtered1.png)

The Final Output Image for density calculations is:
![](Number%20Plate/density.jpg)

