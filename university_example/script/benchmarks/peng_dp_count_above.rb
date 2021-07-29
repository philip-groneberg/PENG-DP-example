require 'benchmark/ips'
require_relative "../../config/environment"

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(:time => 10, :warmup => 5)

  # To reduce overhead, the number of iterations is passed in
  # and the block must run the code the specific number of times.
  # Used for when the workload is very small and any overhead
  # introduces incorrectable errors.
  x.report("Count above without Peng_dp") do |times|
    i = 0
    while i < times
      StudentGrade.where("points > ?", 50).count
      i += 1
    end
  end

  x.report("Count above outside Database") do |times|
    i = 0
    while i < times
      point_results = StudentGrade.all.pluck(:id)
      count = 0
      for point_result in point_results
        if point_result > 50
          count += 1
        end
      end
      i += 1
    end
  end

  x.report("Count above with Peng_dp (epsilon = 0.5)") do |times|
    i = 0
    while i < times
      StudentGrade.all.dp_count_above(:points, 50, 0.5)
      i += 1
    end
  end

  x.report("Count above with Peng_dp (epsilon = 1)") do |times|
    i = 0
    while i < times
      StudentGrade.all.dp_count_above(:points, 50, 1)
      i += 1
    end
  end

  x.report("Count above with Peng_dp (epsilon = 2)") do |times|
    i = 0
    while i < times
      StudentGrade.all.dp_count_above(:points, 50, 2)
      i += 1
    end
  end


  x.report("Count above with Peng_dp (epsilon = 4)") do |times|
    i = 0
    while i < times
      StudentGrade.all.dp_count_above(:points, 50, 4)
      i += 1
    end
  end

  # Compare the iterations per second of the various reports!
  x.compare!
end