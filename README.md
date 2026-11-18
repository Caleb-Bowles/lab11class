# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names

## Summary

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
Our counter required 6 clock cycles to turn the led[6] from off to on. it required 6 more cycles to go from on back to off. Thus for every 6 clock cycles, you only complete 1/2 the cycle of the slower clock cycle that is 12 clock cycles total. 

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
I am assuming this question meant "ripple" counter and not "ring" counter. If all Q values are initialized to 0, and all T's are 1, when the first clock cycles comes through, the first T flip flop with cause Q[0] to transition from 0 to 1. The next T flip flop Clock state is dependent on Q[0], so it will follow the exact same procedure to toggle Q[0] from 0 to 1. This process happens for the third and n'th t flip flop.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
Again, im assuming this question is actually asking for the width of "ripple" counter, not "ring" counter. Assuming the basys 3 frequency of 100Mhz, the ratio needed to plug into our equation for identifying n needed flip flops is 100Mhz/1kHz= 100k. Our equation is n=log_2(ratio). Plugging in 100000 we get 16.69, meaning we need around 16 to 17 T flip flops to produce a clock speed of roughly 1kHz if our imput clock operates at 100MHz.

