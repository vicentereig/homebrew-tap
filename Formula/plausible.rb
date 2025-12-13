class Plausible < Formula
  desc "Automate Plausible Analytics from the CLI"
  homepage "https://github.com/vicentereig/plausible-cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/plausible-cli/releases/download/v#{version}/plausible-darwin-amd64.tar.gz"
      sha256 "SHA256_DARWIN_AMD64"
    end
    on_arm do
      url "https://github.com/vicentereig/plausible-cli/releases/download/v#{version}/plausible-darwin-arm64.tar.gz"
      sha256 "SHA256_DARWIN_ARM64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/plausible-cli/releases/download/v#{version}/plausible-linux-amd64.tar.gz"
      sha256 "SHA256_LINUX_AMD64"
    end
    on_arm do
      url "https://github.com/vicentereig/plausible-cli/releases/download/v#{version}/plausible-linux-arm64.tar.gz"
      sha256 "SHA256_LINUX_ARM64"
    end
  end

  def install
    if OS.mac?
      bin.install Hardware::CPU.intel? ? "plausible-darwin-amd64" => "plausible" : "plausible-darwin-arm64" => "plausible"
    elsif OS.linux?
      bin.install Hardware::CPU.intel? ? "plausible-linux-amd64" => "plausible" : "plausible-linux-arm64" => "plausible"
    end
  end

  test do
    assert_match "plausible", shell_output("#{bin}/plausible --help")
  end
end
