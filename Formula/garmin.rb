class Garmin < Formula
  desc "CLI for Garmin Connect API - activities, health metrics, and more"
  homepage "https://github.com/vicentereig/garmin-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-darwin-amd64.tar.gz"
      sha256 "placeholder"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-darwin-arm64.tar.gz"
      sha256 "placeholder"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-linux-amd64.tar.gz"
      sha256 "placeholder"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-linux-arm64.tar.gz"
      sha256 "placeholder"
    end
  end

  def install
    if OS.mac?
      bin.install Hardware::CPU.intel? ? "garmin-darwin-amd64" => "garmin" : "garmin-darwin-arm64" => "garmin"
    elsif OS.linux?
      bin.install Hardware::CPU.intel? ? "garmin-linux-amd64" => "garmin" : "garmin-linux-arm64" => "garmin"
    end
  end

  test do
    assert_match "garmin", shell_output("#{bin}/garmin --help")
  end
end
