class Templatizer < Formula
    desc "A real templatizer repository engine"
    homepage "https://github.com/wesovilabs/templatizer"
    url "https://github.com/wesovilabs/templatizer/archive/v0.0.1.tar.gz"
    #sha256 "7852a5500f3e35a47b57d138c756de5641bc3c48bf7e329d2724c1107ccb1207"
  
    depends_on "go"
  
    def install
      ENV["GOPATH"] = buildpath
      ENV["GO111MODULE"] = "on"
      ENV["GOFLAGS"] = "-mod=vendor"
      ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
      (buildpath/"src/github.com/wesovilabs/templatizer").install buildpath.children
      cd "src/github.com/wesovilabs/templatizer" do
        system "go", "build", "-o", bin/"templatizer", "."
      end
    end

  end