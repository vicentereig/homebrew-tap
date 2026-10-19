class Garmin < Formula
  desc "CLI for Garmin Connect API - activities, health metrics, and more"
  homepage "https://github.com/vicentereig/garmin-cli"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.2.0/garmin-darwin-amd64.tar.gz"
      sha256 "3bc58034a10547b0c73bd358d3b73ced855b984d4f411280dfa44d9d059f66c1"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.2.0/garmin-darwin-arm64.tar.gz"
      sha256 "b92974f3b9a7aca9f2360ca866585d5281a25db6ae80e7883a7ca40adb648ab8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.2.0/garmin-linux-amd64.tar.gz"
      sha256 "e34b7dc700bf1dfe532b41490f380a86fd229aaceb7f7713e1d0b6d947cf7ea1"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.2.0/garmin-linux-arm64.tar.gz"
      sha256 "9140707738ca5211bc0174b47e1b57662fb763db156259fad4239337a9bba430"
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
