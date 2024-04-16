# StringCalculator

StringCalculator is a simple Ruby class that provides a method for adding numbers passed as a string input. It supports various delimiters and can handle negative numbers.

## Installation

Clone or download the `string_calculator.rb` file to your Ruby project directory.

## Usage

```ruby
require_relative 'string_calculator'

# Create an instance of StringCalculator
calculator = StringCalculator.new

# Add numbers using the add method
result = calculator.add("1,2,3")
puts result

## **Features**
  Supports adding numbers provided as a string input.
  Supports different delimiters including commas (,), new lines (\n), and custom delimiters.
  Raises an exception if negative numbers are found in the input string.
  Raises an exception for invalid input format when the input ends with a delimiter without any following number.

**Testing**
  The code includes RSpec tests to verify the behavior of the StringCalculator class. Run the tests using the following command:
  rspec string_calculator_spec.rb
