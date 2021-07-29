# PengDP Example Project

This Rails project is a small demonstration on how to use the [PengDp Gem](https://github.com/philip-groneberg/PENG-DP). The project reflects a simple student grading application that uses a dataset created through the [Faker Gem](https://github.com/faker-ruby/faker). To populate the database run:

  $ rails db:seed

The `peng_dp` gem is added inside the [Gemfile](https://github.com/philip-groneberg/PENG-DP-example/blob/master/university_example/Gemfile).

```ruby
# Gem for differential privacy
gem 'peng_dp'
```

The example integration of the gem can then be found inside [app/views/student_grades/index.html.erb](https://github.com/philip-groneberg/PENG-DP-example/blob/master/university_example/app/views/student_grades/index.html.erb).
