# frozen_string_literal: true

require 'grpc'
require_relative 'lib/calc_services_pb'

def main(input)
  stub = Example::Calc::Stub.new('localhost:50051', :this_channel_is_insecure)
  output = stub.solve(Example::Input.new(question: input))
  p "答えは #{output.answer}"
end

p '計算式を書いてください'
input = gets.chomp
main(input)
