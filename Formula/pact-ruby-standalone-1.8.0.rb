class PactRubyStandalone180 < Formula
  desc "Standalone pact CLI executable using the Ruby Pact impl and Travelling Ruby"
  homepage "https://github.com/pact-foundation/pact-ruby-standalone"
  version "1.8.0"

  on_macos do
    on_arm do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.8.0/pact-1.8.0-osx.tar.gz"
      sha256 "2f1e0b412fc16f4da093377e5efbd752517f3768bb8287869d1f8493ff149ed8"
    end
    on_intel do
      url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.8.0/pact-1.8.0-osx.tar.gz"
      sha256 "2f1e0b412fc16f4da093377e5efbd752517f3768bb8287869d1f8493ff149ed8"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.8.0/pact-1.8.0-linux-x86_64.tar.gz"
        sha256 "794200c7e8ffca638cd91825cfc639afdafb31e2bd2a66f835bc3a75616c80f6"
      end
    end
   if Hardware::CPU.is_32_bit?
      on_intel do
        url "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.8.0/pact-1.8.0-linux-x86.tar.gz"
        sha256 "e25168fd052fd0c74cf5d58474d0443948d4b350138eba3fe4e375c611f6ba46"
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
