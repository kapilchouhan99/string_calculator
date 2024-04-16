class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = extract_delimiter(numbers)
    numbers_array = extract_numbers(numbers, delimiter)
    sum = calculate_sum(numbers_array)

    raise_negatives_exception(numbers_array) if negatives_exist?(numbers_array)
    raise_invalid_format_exception(numbers) if invalid_format?(numbers)

    sum
  end

  private

  def extract_delimiter(numbers)
    delimiter = ","
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers.slice!(0..3)
    end
    delimiter.gsub(/[\[\]]/, "\\0")  # Handle delimiter inside brackets
  end

  def extract_numbers(numbers, delimiter)
    numbers.split(/#{delimiter}\n|#{delimiter}|,(?=\n|$)|\n/).map(&:to_i)
  end

  def calculate_sum(numbers_array)
    numbers_array.reduce(0, :+)
  end

  def negatives_exist?(numbers_array)
    numbers_array.any? { |num| num.negative? }
  end

  def raise_negatives_exception(numbers_array)
    negatives = numbers_array.select { |num| num.negative? }
    raise "Negative numbers not allowed: #{negatives.join(', ')}"
  end

  def invalid_format?(numbers)
    numbers.include?(",\n")
  end

  def raise_invalid_format_exception(numbers)
    raise "Invalid input format"
  end
end

# Example usage
calculator = StringCalculator.new
puts calculator.add("")   # Output: 0
puts calculator.add("1")  # Output: 1
puts calculator.add("1\n2,3")  # Output: 6
puts calculator.add("//;\n1;2")  # Output: 3
# puts calculator.add("-1,2")  # Output: Exception: Negative numbers not allowed: -1
# puts calculator.add("-1,-2,3,-4")  # Output: Exception: Negative numbers not allowed: -1, -2, -4
# puts calculator.add("1,\n")  # Output: Exception: Invalid input format
# puts calculator.add("5,\n")  # Output: Exception: Invalid input format
