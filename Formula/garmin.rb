class Garmin < Formula
  desc "CLI for Garmin Connect API - activities, health metrics, and more"
  homepage "https://github.com/vicentereig/garmin-cli"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-darwin-amd64.tar.gz"
      sha256 "41000a4b3720deab9095f6c1c323e88a3c5a2f1ff97eb580f1dcb4786c9321ab"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-darwin-arm64.tar.gz"
      sha256 "12cc4e120f6d31974dc8c0fbf8e94a9887769ee30f7d2c984d38a291070222db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-linux-amd64.tar.gz"
      sha256 "00770f9c022ec247aa17c32a9f04ab6d4716dbdf9f8c3028342ae8bb5a927d61"
    end
    on_arm do
      url "https://github.com/vicentereig/garmin-cli/releases/download/v#{version}/garmin-linux-arm64.tar.gz"
      sha256 "fe6c8a246719880a6a1ecbd9b4d355a6ba17edc5ddf20d7cc6c0758ef3f1aedc"
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
