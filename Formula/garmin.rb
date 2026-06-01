class Garmin < Formula
  desc "CLI for Garmin Connect API - activities, health metrics, and more"
  homepage "https://github.com/vicentereig/garmin-cli"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.1.0/garmin-darwin-amd64.tar.gz"
      sha256 "f17a92c73531d300fc0efddc81094288592b4303762e282c346488d5a9ae6152"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.1.0/garmin-darwin-arm64.tar.gz"
      sha256 "e5e49cab3e0f116183f947577d433c598d6add1d9a491e6ac4632db4c2ca8f43"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.1.0/garmin-linux-amd64.tar.gz"
      sha256 "b83390f6669fde0d0e00ff6e123818a3837ea826fc88f2bed6fcce807b76a592"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.1.0/garmin-linux-arm64.tar.gz"
      sha256 "6eec6e6948011869978c958a817bb601757a48bd00b7e21a15951829ac2875b2"
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
