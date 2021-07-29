require 'benchmark/ips'
require_relative "../../config/environment"

# student = Student.new(first_name: "Bob")

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(:time => 10, :warmup => 5)

  # To reduce overhead, the number of iterations is passed in
  # and the block must run the code the specific number of times.
  # Used for when the workload is very small and any overhead
  # introduces incorrectable errors.
  x.report("Average without Peng_dp") do |times|
    i = 0
    while i < times
      StudentGrade.all.average(:points)
      i += 1
    end
  end

  x.report("Average outside Database") do |times|
    i = 0
    while i < times
      point_results = StudentGrade.all.pluck(:points)
      sum = 0
      for point_result in point_results
        sum = sum + point_result
      end
      result = sum / point_results.size
      i += 1
    end
  end

  x.report("Average with Peng_dp (epsilon = 0.5)") do |times|
    i = 0
    while i < times
      StudentGrade.all.dp_average(:points, 0.5)
      i += 1
    end
  end

  x.report("Average with Peng_dp (epsilon = 1)") do |times|
    i = 0
    while i < times
      StudentGrade.all.dp_average(:points, 1)
      i += 1
    end
  end

  x.report("Average with Peng_dp (epsilon = 2)") do |times|
    i = 0
    while i < times
      StudentGrade.all.dp_average(:points, 2)
      i += 1
    end
  end

  x.report("Average with Peng_dp (epsilon = 4)") do |times|
    i = 0
    while i < times
      StudentGrade.all.dp_average(:points, 4)
      i += 1
    end
  end

  # Compare the iterations per second of the various reports!
  x.compare!
end