# frozen_string_literal: true

require 'grpc'
require_relative 'lib/calc_services_pb'

class CalcServer < Example::Calc::Service
  def solve(input, _unused_call)
    answer = eval(input.question)

    Example::Output.new(answer:)
  end
end

s = GRPC::RpcServer.new
s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
s.handle(CalcServer)
s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
