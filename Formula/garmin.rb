class Garmin < Formula
  desc "CLI for Garmin Connect API - activities, health metrics, and more"
  homepage "https://github.com/vicentereig/garmin-cli"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-darwin-amd64.tar.gz"
      sha256 "Not"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-darwin-arm64.tar.gz"
      sha256 "Not"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-linux-amd64.tar.gz"
      sha256 "Not"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-linux-arm64.tar.gz"
      sha256 "Not"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "garmin-darwin-amd64" => "garmin"
      else
        bin.install "garmin-darwin-arm64" => "garmin"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        bin.install "garmin-linux-amd64" => "garmin"
      else
        bin.install "garmin-linux-arm64" => "garmin"
      end
    end
  end

  test do
    assert_match "garmin", shell_output("#{bin}/garmin --help")
  end
end
