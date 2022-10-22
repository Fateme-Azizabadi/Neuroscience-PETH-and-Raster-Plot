# Neuroscience-PETH and Raster-Plot

# **Neuroscience-PETH and Raster-Plot**

**Neuroscience-PETH and Raster-Plot**

**In this project, we will learn about two Raster Plot and PETH tools.**

## **Raster-Plot**
A raster plot is a simple way to examine the test-to-test variability of responses visually.
The most important information about the spikes is the time of their occurrence, and the shape and size of the spikes are unnecessary. For this purpose, we first read the Q2_data.mat file from the input.
This file contains 100 tests obtained for 250 milliseconds with a sampling frequency of Fs=2kHz. That is, each experiment contains 500 numbers, the first 100 numbers correspond to the first 50 milliseconds (-0.05 s,0) and the next 400 numbers correspond to the next 200 milliseconds (0 s, 0.2s).
First, in each experiment, when we had a value of 1, which means a spike, we calculated its time using the sampling frequency for every 100 experiments. As a result, we get a cell array named spikes_time that shows the time of spiking for every 100 tests.
In the next part, the function takes the spike time vector of each trial and draws its Raster Plot.
Next, the Raster Plot is drawn for 100 tests and the first 20 tests.

 ![](https://github.com/Fateme-Azizabadi/Neuroscience-PETH-and-Raster-Plot/blob/main/Images/Raster.png)

## **PETH**

**Estimation of Firing Rate using rectangular window:**

A quick look shows that there is no unique and well-defined concept of "Mean Firing rate". In fact, there are at least three different concepts of rate that are often confused and used simultaneously. These three definitions refer to three different averaging methods: averaging over time, averaging over multiple trial repetitions, averaging over a population of neurons. The following three subsections will revisit these three concepts in detail.

* **Rate as a Spike Count**
The first and most common definition of Firing Rate refers to the time average. Firing rate in experiment k is equal to the number of spikes n_k^sp in a period of time T divided by T. That is, we consider a time window T and count the number of spikes.
The length of T is the time window determined by the experimenter and depends on the type of neuron and the stimulus. In practice, multiple spikes must occur in the time window to obtain reasonable averages. Typical values ​​are T=100 ms or T=500 ms, but the duration may be longer or shorter.
If the same experiment is repeated several times, the number of spikes measured will vary between one experiment and the next. Therefore, we consider their average.

* **Rate as a Spike Density and the Peri-Stimulus-Time Histogram (PSTH, PETH)**

A trial is recorded from a single neuron while the input is stimulated with a successive value. The same stimulation sequence is repeated several times, and the neural response is reported in the Peri-Stimulus-Time histogram (PSTH) or PETH, with the value of bin width Δt. The time t is measured relative to the start of the stimulus sequence, and Δt defines the time bin for generating the histogram, usually in the order of milliseconds, which is the same time window.
The number of spikes n_K (t; t+Δt) collected in all experiment repetitions divided by the number of repetitions K is a measure of the normal activity of the neuron between time t and t+Δt. Further dividing by the interval length Δt gives the density of spikes.
As an experimental method, PSTH measurement is valuable for assessing neural activity, especially for time-dependent stimuli.

* **Rate as a Population Activity (Average over Several Neurons)**
The number of neurons in the brain is very large. Often many neurons have similar properties and respond to the same stimuli. Therefore, sometimes to get the firing rate, they average the spikes of a set of neurons.

**Why do they use windowing to estimate the histogram?**
The windows determine how many spikes we have in a time interval T, so it is determined when the spike occurred more and when there was less activity. Therefore, the Firing Rate check is much faster and more readable. In fact, the histogram divides the data into classes, here our data are spikes, and the classes are actually time intervals of window length.

 ![](https://github.com/Fateme-Azizabadi/Neuroscience-PETH-and-Raster-Plot/blob/main/Images/PETH.png)







 
