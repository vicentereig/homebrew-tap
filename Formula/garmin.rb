class Garmin < Formula
  desc "CLI for Garmin Connect API - activities, health metrics, and more"
  homepage "https://github.com/vicentereig/garmin-cli"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.2/garmin-darwin-amd64.tar.gz"
      sha256 "fc81d99b96ff16e552b77e98bb49b4342d5b970812eb1fb2ce3f205fa488c7cb"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.2/garmin-darwin-arm64.tar.gz"
      sha256 "9d5e38884a95b659919b7ca7e089be6dc5f9d68c29f20b0af9643b5c11a92b29"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.2/garmin-linux-amd64.tar.gz"
      sha256 "32d19e9dad8646225a13b72dc7b5616b1a8fbfa3d204d8f3b1ed8738ea204bc6"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.2/garmin-linux-arm64.tar.gz"
      sha256 "056104e165406e42f3d50d852a73117a54ab648615cebb05b650ee663226d269"
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
