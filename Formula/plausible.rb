class Plausible < Formula
  desc "Automate Plausible Analytics from the CLI"
  homepage "https://github.com/vicentereig/plausible-cli"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/plausible-cli/releases/download/v#{version}/plausible-darwin-amd64.tar.gz"
      sha256 "7bad117833807b9164c5b6d288a3ba15d93cb01c03e70e513ba1e988a1891735"
    end
    on_arm do
      url "https://github.com/vicentereig/plausible-cli/releases/download/v#{version}/plausible-darwin-arm64.tar.gz"
      sha256 "5a223bf6fd57e746feb74a6a3e55498b564c91f4cea141b748f98501e2d44e1e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/plausible-cli/releases/download/v#{version}/plausible-linux-amd64.tar.gz"
      sha256 "3d871d471733e617c2cc84900c7f27fbd3a6cd1e9f62af7a57756315d512dfd9"
    end
    on_arm do
      url "https://github.com/vicentereig/plausible-cli/releases/download/v#{version}/plausible-linux-arm64.tar.gz"
      sha256 "c850f0c69d2e624a22dcd5f41f0a12ffb56ec22d75661a94022020c73a032537"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "plausible-darwin-amd64" => "plausible"
      else
        bin.install "plausible-darwin-arm64" => "plausible"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        bin.install "plausible-linux-amd64" => "plausible"
      else
        bin.install "plausible-linux-arm64" => "plausible"
      end
    end
  end

  test do
    assert_match "plausible", shell_output("#{bin}/plausible --help")
  end
end
