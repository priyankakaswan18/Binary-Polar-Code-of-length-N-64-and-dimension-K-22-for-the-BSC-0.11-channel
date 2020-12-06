The package is operated through mainfile.m.

# Binary-Polar-Code-of-length-N-64-and-dimension-K-22-for-the-BSC-0.11-channel

We identify frozen bits (or the complementary set of information bits) through 2 methods
1. Bhattacharyya parameter based method
2. Monte Carlo based method (for this part I used matlab functions in "H. D. Pfister. “A Brief Introduction to Polar Codes”. Lecture notes, http://pfister.ee.duke.edu/courses/ecen655/polar.pdf, 21- April-2014, last accessed 22-July-2018. 2014.")

## Bhattacharyya parameter based method
In the initial paper, Arikan utilizes Bhattacharyya parameter as another measurement of channel quality. Since there is no efficient algorithm to compute Bhattacharyya parameters, we use the upperbounds given by equation 34 and 35 in "E. Arikan, "Channel Polarization: A Method for Constructing Capacity-Achieving Codes for Symmetric Binary-Input Memoryless Channels," in IEEE Transactions on Information Theory, vol. 55, no. 7, pp. 3051-3073, July 2009".

The process begins by computing Bhattacharya parameter Z=2*sqrt(p*(1-p)), and the equations 34 and 35 are recursively implemented until the required number of channels are generated. Channels with smallest Bhattacharyya parameter are chosen to carry information bits.

## Monte Carlo based method 
Here BER (Bit error rate) is used as proxy for channel quality. We transmit a known codeword and use a polar decoder estimate the output bits, while using genie-aided decisions for output bits. This process is repeated large number of times, and average number of received errors are computed for all channels. Channels with smallest BER are chosen to carry information bits.


## Functions 
- choose_frozen_bits.m : chooses the channels with poorest channel quality to be frozen
- compute_bhattacharyya_parameters.m : computes bhattacharyya parameters for all channels to estimate channel qualities
- Monte_carlo.m : uses the polar_decode.m to find BER of all channels with 1000 simulations. (used from http://pfister.ee.duke.edu/courses/ecen655/polar.pdf)
- permute_input.m : applies bit reversal permutation to input codeword before applying successive polar transforms 
- polar_decode.m : applies polar decoder (used from http://pfister.ee.duke.edu/courses/ecen655/polar.pdf)
- polar_transform.m : applies polar transformation directly to non-permuted codewords (used from http://pfister.ee.duke.edu/courses/ecen655/polar.pdf)
- polar_transform.m : applied polar transformation to codewords which have bit reversal permutation already applied
- RMrows.m : computes information bits for Reed Muller codes, for comparison

## Flow of implementation
First channel quality measures like BER or bhattacharyya parameters are calculated for all channels. Then bit reversal permutation is applied to vector of quality measure and frozen bits are figured out.
Then a random message vector is created and the codeword is created, with 0's at frozen bits, and information from message at remaining bits. Then polar transform is applied to the codeword to generate the vector that is actually sent across the real channel.

## Note
Both methods don't identify same frozen bits, when the dimension of code is not very large, due to approximations in bhattacharyya method. Further, the frozen bits in monte carlo are determined from real time simuations, hence there could be slight difference in chosen channels in repeated simulations.
