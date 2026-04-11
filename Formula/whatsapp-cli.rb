class WhatsappCli < Formula
  desc "Command-line interface for WhatsApp using whatsmeow"
  homepage "https://github.com/vicentereig/whatsapp-cli"
  version "1.3.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-darwin-amd64.tar.gz"
      sha256 "2e978d3b19085d484f936e0eb11922d1eaa48301dfc43ff5d2462dcc276c9ff3"
    end
    on_arm do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-darwin-arm64.tar.gz"
      sha256 "8f12d20b9fa385ca0fe8e6879ad9a9ca68a87e29411a158aa1ea1c2619f2fb3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-linux-amd64.tar.gz"
      sha256 "bb0e9fc134cf217b88d00e7ea1f6ac4ba3a288dcf79a52f1419bebae0739ccf6"
    end
    on_arm do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-linux-arm64.tar.gz"
      sha256 "12c5d2dd0925e228e4b99c9032464bbeeae95b2f99e946d73f66b679b50ad4b5"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "whatsapp-cli-darwin-amd64" => "whatsapp-cli"
      else
        bin.install "whatsapp-cli-darwin-arm64" => "whatsapp-cli"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        bin.install "whatsapp-cli-linux-amd64" => "whatsapp-cli"
      else
        bin.install "whatsapp-cli-linux-arm64" => "whatsapp-cli"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whatsapp-cli version")
  end
end
