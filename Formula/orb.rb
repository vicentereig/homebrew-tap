class Orb < Formula
  desc "Orb billing forensics from the terminal"
  homepage "https://github.com/vicentereig/orb"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vicentereig/orb/releases/download/v0.1.2/orb-darwin-arm64.tar.gz"
      sha256 "24d02f31597cc3fa0b80ffdc2abf88430f0c7098381d4c69ca5294ab9b4f7746"
    else
      url "https://github.com/vicentereig/orb/releases/download/v0.1.2/orb-darwin-amd64.tar.gz"
      sha256 "3755b16647332f86f17d84ea5f69ee22238d8e0876eefbbbd06a56f50cc5062c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vicentereig/orb/releases/download/v0.1.2/orb-linux-arm64.tar.gz"
      sha256 "febc0ce6b61294d331007a0c65b226f43145d0db45253d5a07d5d7b09a9b1424"
    else
      url "https://github.com/vicentereig/orb/releases/download/v0.1.2/orb-linux-amd64.tar.gz"
      sha256 "4e65ead20cfcf681f080b52639c72042a2c12d67de21362bcb2198064ad9edbe"
    end
  end

  def install
    bin.install Dir["orb-*"].first => "orb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orb version")
  end
end
