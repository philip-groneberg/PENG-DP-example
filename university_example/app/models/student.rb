# require "inline"
  
class Student < ApplicationRecord
  # inline do |builder|
  #   builder.c "
  #     long factorial(int max) {
  #       int i=max, result=1;
  #       while (i >= 2) { result *= i--; }
  #       return result;
  #     }"
  # end
end
