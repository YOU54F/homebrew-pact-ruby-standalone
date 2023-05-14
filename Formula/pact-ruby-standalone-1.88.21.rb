class PactRubyStandalone18821 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.88.21"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.21/pact-1.88.21-osx.tar.gz"
      sha256 "ddfc5ad1afda446d1ecb59eb931613015ea105cfa02f89eb3c30e6ebbfd75d99"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.21/pact-1.88.21-osx.tar.gz"
      sha256 "ddfc5ad1afda446d1ecb59eb931613015ea105cfa02f89eb3c30e6ebbfd75d99"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.21/pact-1.88.21-linux-x86_64.tar.gz"
        sha256 "ca63cf9a752726381cf74842fef8e0808566648a800fe1956079129fecab1c5a"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.21/pact-1.88.21-linux-x86.tar.gz"
        sha256 "c760b2f5ed196f36650136eb2d927df2ab2f61f3232ee85db7599fec6c92c250"
      end
    end
  end

  def install
    # pact-ruby-standalone
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    puts "# (see https://github.com/pact-foundation/pact-ruby-standalone/releases/)'"
    puts "# Run 'pact --help'"
    puts "# Run 'pact-broker --help'"
    puts "# Run 'pact-message --help'"
    puts "# Run 'pact-mock-service --help'"
    puts "# Run 'pact-provider-verifier --help'"
    puts "# Run 'pact-stub-service --help'"
  end

  test do
    system "#{bin}/pact", "--help"
    system "#{bin}/pact-broker", "--help"
    system "#{bin}/pact-message", "--help"
    system "#{bin}/pact-mock-service", "--help"
    system "#{bin}/pact-provider-verifier", "--help"
    system "#{bin}/pact-stub-service", "--help"
  end
end
