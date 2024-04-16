require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'when input is empty' do
      it 'returns 0' do
        calculator = StringCalculator.new
        expect(calculator.add("")).to eq(0)
      end
    end

    context 'when input contains one number' do
      it 'returns the number' do
        calculator = StringCalculator.new
        expect(calculator.add("5")).to eq(5)
      end
    end

    context 'when input contains two numbers separated by comma' do
      it 'returns the sum of the numbers' do
        calculator = StringCalculator.new
        expect(calculator.add("1,5")).to eq(6)
      end
    end

    context 'when input contains numbers separated by newline and comma' do
      it 'returns the sum of the numbers' do
        calculator = StringCalculator.new
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when input contains numbers with a custom delimiter' do
      it 'returns the sum of the numbers' do
        calculator = StringCalculator.new
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when input contains negative numbers' do
      it 'raises an exception with the negative numbers in the message' do
        calculator = StringCalculator.new
        expect { calculator.add("-1,-2,3,-4") }.to raise_error(RuntimeError, "Negative numbers not allowed: -1, -2, -4")
      end
    end

    context 'when input ends with a delimiter without any following number' do
      it 'raises an exception with message "Invalid input format"' do
        calculator = StringCalculator.new
        expect { calculator.add("5,\n") }.to raise_error(RuntimeError, "Invalid input format")
      end
    end
  end
end
