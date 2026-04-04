class Garmin < Formula
  desc "CLI for Garmin Connect API - activities, health metrics, and more"
  homepage "https://github.com/vicentereig/garmin-cli"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.1/garmin-darwin-amd64.tar.gz"
      sha256 "871f0c8d6fa59c73711d4055eebe4131bfa941264e36a545a7270abf5a5143d8"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.1/garmin-darwin-arm64.tar.gz"
      sha256 "1905c4a20dafffe9fd9de746501a09d363260407332b31b84d72e2e04e20917c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.1/garmin-linux-amd64.tar.gz"
      sha256 "02fe3d60efd77e0ed726bf8b5138e794ee281d4755449c61976518b14b33ef8f"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v2.0.1/garmin-linux-arm64.tar.gz"
      sha256 "f1fe57b010a328b3df8d0bd9be59932a20c9a001d9a68e724ed95ce3855e0b3c"
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
