class Garmin < Formula
  desc "CLI for Garmin Connect API - activities, health metrics, and more"
  homepage "https://github.com/vicentereig/garmin-cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.0/garmin-darwin-amd64.tar.gz"
      sha256 "6e929fcf819a809c0cc33a1057c939f8423b406e5ada4c469b9b599ac6803e44"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.0/garmin-darwin-arm64.tar.gz"
      sha256 "0a0617250a14f43b8ba8249081c58b1c13d00ccaa0790f26c2df65746f381412"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.0/garmin-linux-amd64.tar.gz"
      sha256 "27d331171a8d8ebe28ca72cb92a1b60717b5a759fd57ce1bc8bf47e64b10861b"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.0/garmin-linux-arm64.tar.gz"
      sha256 "946d963749161049696e369ac1c61eaf691dbc11625a30a10269fc08441426b9"
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
