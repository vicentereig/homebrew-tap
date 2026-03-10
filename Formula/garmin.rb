class Garmin < Formula
  desc "CLI for Garmin Connect API - activities, health metrics, and more"
  homepage "https://github.com/vicentereig/garmin-cli"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v1.0.6/garmin-darwin-amd64.tar.gz"
      sha256 "afac81c654840850f40603c7fdc649feda75fdff0ed3b3f2a068b8832e41d6c9"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v1.0.6/garmin-darwin-arm64.tar.gz"
      sha256 "2ee43bfb6b94cf2c338a8a9e21c6dd4822c41480788968c023e673cf6e166cdb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v1.0.6/garmin-linux-amd64.tar.gz"
      sha256 "db81953df951cf739bf12cf327cc6d81a9e2825c31c10f81bad55ad62554a376"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v1.0.6/garmin-linux-arm64.tar.gz"
      sha256 "4c30b37c319da1729e23336aba298eeae5cc26175ea43a6b20aeb2240f94e083"
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
