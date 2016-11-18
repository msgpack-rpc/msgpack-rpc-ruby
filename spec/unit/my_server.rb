class MyServer
  @port = 65500
  attr_accessor :port


  def initialize(svr)
    @svr = svr
    @count = 0
  end

  def hello
    "ok"
  end

  def sum(a, b)
    a + b
  end

  def count
    @count
  end

  def increase_count
    @count += 1
  end

  def exception
    raise "raised"
  end

  def async
    as = MessagePack::RPC::AsyncResult.new
    @svr.start_timer(1, false) do
      as.result "async"
    end
    as
  end

  def async_exception
    as = MessagePack::RPC::AsyncResult.new
    @svr.start_timer(1, false) do
      as.error "async"
    end
    as
  end

  def self.port
    @port
  end

  private
  def hidden

  end
end




module MyServerTest
  def start_client(port)
    cli = MessagePack::RPC::Client.new("127.0.0.1", port)
    cli.timeout = 10
    return cli
  end

  def start_server
    port = PortHelper.find_port
    svr = MessagePack::RPC::Server.new
    svr.listen("0.0.0.0", port, MyServer.new(svr))
    Thread.start do
      svr.run
      svr.close
    end
    return svr, start_client(port)
  end

  def server_start_loop
    port = PortHelper.find_port

    loop = MessagePack::RPC::Loop.new
    svr =MessagePack::RPC::Server.new(loop)
    svr.listen("0.0.0.0", port ,MyServer.new(svr))

    cli = MessagePack::RPC::Client.new("127.0.0.1", port, loop)
    cli.timeout = 10

    return svr,cli
  end
end

module PortHelper
  def self.find_port
    s = TCPServer.new('127.0.0.1', 0)
    port = s.addr[1]
    port
  ensure
    s.close
  end
end
