<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Digital neuron thereshold evaluator manifested as a fast magnitude comparator.  

This component is based upon well-documented Clint Cole (Digilent) bit-sliced expandable structural code. 
https://www.realdigital.org/doc/a39d855f71772426c968c0151112b476
The bitslice module has been modified from naive Verilog to AND-INV format to target optimized ABC9 AIG graph synthesis in OpenLane2.

This implementation is intentionally unclocked for measurements, and can be easily modified as a windowing-comparator 
for inference field requirements.

The fast magnitude comparator is second of a series of common, scaleable library of elements
intended to support CMOS digital neuron biomemetic building blocks, the first being a
scaleable fast accumulator for vector evaluation and integration based upon a generated
Sklansky adder/subtractor.

## How to test

The user will supply two numbers of appropriate length (A, B, each 8 bits in this case) with returning signals
indicating "A less than B", "A equal to B", or "A greater than B" as LT_out, EQ_out, and GT_out respectively.

![IOs_2](https://github.com/drburke3/FastMagnitudeComparator/assets/782159/098e4a18-069b-4d23-bb30-56c7cb443706)

## External hardware

Means to supply appropiate width words (in this instance one 8b byte) and read back GT, EQ, LT signals.
