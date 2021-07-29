# Benchmarking Google Differential Privacy Library
For benchmarking the Google Differential Privacy Library we use another Google library called Google Benchmark. We build on top of the example provided in the Google Differential Privacy library and wrap the functions (Sum,Count,Mean,Max) with the google benchmark wrapper and then execute the benchmark.

To execute the code:

```shell
$ bazel run report_the_carrots
