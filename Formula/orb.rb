class Orb < Formula
  desc "Orb billing forensics from the terminal"
  homepage "https://github.com/vicentereig/orb"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vicentereig/orb/releases/download/v0.1.1/orb-darwin-arm64.tar.gz"
      sha256 "194cb98e04c67715f0432d0cc9d65664247453832ed29af6d264de02d58424b9"
    else
      url "https://github.com/vicentereig/orb/releases/download/v0.1.1/orb-darwin-amd64.tar.gz"
      sha256 "49c7ff3498ca7f7b3923798dfda084fbdb3ff77934a2db7e22dea17ab1c3e26a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vicentereig/orb/releases/download/v0.1.1/orb-linux-arm64.tar.gz"
      sha256 "91062a089eab6ce6ffe42028cf387427c5f6f8402cf0df7259fb002b85e3304c"
    else
      url "https://github.com/vicentereig/orb/releases/download/v0.1.1/orb-linux-amd64.tar.gz"
      sha256 "e1be95c61428bed73845ed147dd877deedf6ad1bda7057d2f509701bedb763f7"
    end
  end

  def install
    bin.install Dir["orb-*"].first => "orb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orb version")
  end
end
