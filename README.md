![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# Fast Magnitude Comparator

- [Read the documentation for project](docs/info.md)

## Background Justification

For neuron thereshold evaluation in digital approaches, a fast magnitude determination is often necessary.

This circuit takes two 8b quantities and outputs whether A is less than B, equal to B, or greater than B as rapidly as possible.

The anticipated usage is to compare an incoming value to a pre-determined threshold (or range) locally, therefore it should compact and fast since it will be replicated many thousands of times.

This component is based upon well-documented Clint Cole (Digilent) bit-sliced expandable, structural code re-expressed in AND-INV format to target optimized ABC9 AIG graph synthesis in OpenLane. https://www.realdigital.org/doc/a39d855f71772426c968c0151112b476

## Implementation

Each component ideally should be:
1.) Described in structural Verilog for future optimization, as opposed to behavioral.
2.) Scale well so as to support varying bit-widths and high-dimensional vector resolutions.
3.) Time-critical paths expressed in AND-INV form to leverage the OpenLane2 ABC9 logic optimizer which uses AIG graphs.

This prototype circuit is intentionally unclocked for measurements, and can be easily modified as a windowing-comparator for inference field requirements.

The fast magnitude comparator is second of a series of common, scaleable library of elements intended to support CMOS digital neuron biomemetic building blocks, the first being a scaleable fast accumulator for vector evaluation and integration based upon a generated Sklansky adder/subtractor.


