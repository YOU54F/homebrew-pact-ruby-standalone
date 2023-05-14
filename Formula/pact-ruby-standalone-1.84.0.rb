class PactRubyStandalone1840 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.84.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.84.0/pact-1.84.0-osx.tar.gz"
      sha256 "73fa53ec53e2e53243cf8cb21feabb8245a7b42e2c0c82e3dfa57906ea983fc0"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.84.0/pact-1.84.0-osx.tar.gz"
      sha256 "73fa53ec53e2e53243cf8cb21feabb8245a7b42e2c0c82e3dfa57906ea983fc0"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.84.0/pact-1.84.0-linux-x86_64.tar.gz"
        sha256 "6acd6cde35bbc51d2ad99d1b89dacaf9d8b6d34b125bfbe3ac3e013d8260574a"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.84.0/pact-1.84.0-linux-x86.tar.gz"
        sha256 "7ec6a1193f8d48d4186c43e4f1703a9c019b0375b39ae6b4e3550d04e9aa3e49"
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
