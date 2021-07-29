//
// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#include <string>

#include "absl/flags/flag.h"
#include "absl/status/status.h"
#include "base/statusor.h"
#include "absl/strings/str_format.h"
#include "absl/strings/string_view.h"
#include "proto/util.h"
#include "animals_and_carrots.h"
#include "proto/confidence-interval.pb.h"
#include "proto/data.pb.h"
#include "benchmark/benchmark.h"

#include <chrono>
#include <string>

using absl::PrintF;
using differential_privacy::BoundingReport;
using differential_privacy::ConfidenceInterval;
using differential_privacy::GetValue;
using differential_privacy::Output;
using differential_privacy::example::CarrotReporter;
using differential_privacy::base::StatusOr;

ABSL_FLAG(std::string, CarrotsDataFile,
          "student_grades.csv",
          "Path to the datafile where the data is stored on the number of "
          "carrots each animal has eaten.");


const double epsilon = 8;
CarrotReporter reporter(absl::GetFlag(FLAGS_CarrotsDataFile), epsilon);

static void BM_Sum(benchmark::State& state){
  for (auto _ : state){
   benchmark::DoNotOptimize(reporter.Sum());
  }
}

static void BM_Mean(benchmark::State& state){
  for (auto _ : state){
   benchmark::DoNotOptimize(reporter.Mean());
  }
}

static void BM_Count(benchmark::State& state){
  for (auto _ : state){
   benchmark::DoNotOptimize(reporter.CountAbove(state.range(0)));
  }
}

static void BM_Max(benchmark::State& state){
  for (auto _ : state){
   benchmark::DoNotOptimize(reporter.Max());
  }
}

static void BM_PrivateSum(benchmark::State& state){
  for (auto _ : state){
   benchmark::DoNotOptimize(reporter.PrivateSum(state.range(0)));
  }
}

static void BM_PrivateMean(benchmark::State& state){
  for (auto _ : state){
   benchmark::DoNotOptimize(reporter.PrivateMean(state.range(0)));
  }
}

static void BM_PrivateCount(benchmark::State& state){
  for (auto _ : state){
   benchmark::DoNotOptimize(reporter.PrivateCountAbove(state.range(0),state.range(1)));
  }
}

static void BM_PrivateMax(benchmark::State& state){
  for (auto _ : state){
   benchmark::DoNotOptimize(reporter.PrivateMax(state.range(0)));
  }
}

BENCHMARK(BM_Sum);
BENCHMARK(BM_Mean);
BENCHMARK(BM_Count)->Arg(0);
BENCHMARK(BM_Max);


/*
BENCHMARK(BM_PrivateSum)->Arg(0);
BENCHMARK(BM_PrivateMean)->Arg(0);
BENCHMARK(BM_PrivateCount)->Args({0,0});
BENCHMARK(BM_PrivateMax)->Arg(0);
*/
BENCHMARK_MAIN();
