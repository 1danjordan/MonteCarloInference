# Monte Carlo Inference
Repo containing code, results, plots and assignments for STAT40400: Monte Carlo Inference, University College Dublin.

I'll use this README as a short explanation for each folder an assignment included in this repo.

##Simulation & Random Numbers
This folder contains scripts implementing the the Middle Square Method and a basic Conguential Number Generator for producing uniform pseudorandom numbers.

The MidsquareMethod script calls midSquare(3792), which returns 3792 on its first iteration, and 3792 on its second interation and so on. We use this value to point out the limitations of this algorithm for producing pseudorandom numbers. 

!(https://github.com/dandermotj/MonteCarloInference/blob/master/Simulation%20%26%20Random%20Numbers/Congruential_Number_Generator.gif)

This animation was produced using the packages ggplot, ggthemes (Tufte's theme) and animation. It illustrates that this basic congruential number generator is clearly not very random - we notice that there are clear spikes of numbers that are more frequent than the rest placed at equally spaced intervals. 

