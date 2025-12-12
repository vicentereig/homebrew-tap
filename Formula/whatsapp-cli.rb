class WhatsappCli < Formula
  desc "Command-line interface for WhatsApp using whatsmeow"
  homepage "https://github.com/vicentereig/whatsapp-cli"
  version "1.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-darwin-amd64.tar.gz"
      sha256 "SHA256_DARWIN_AMD64"
    end
    on_arm do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-darwin-arm64.tar.gz"
      sha256 "SHA256_DARWIN_ARM64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-linux-amd64.tar.gz"
      sha256 "SHA256_LINUX_AMD64"
    end
    on_arm do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-linux-arm64.tar.gz"
      sha256 "SHA256_LINUX_ARM64"
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
