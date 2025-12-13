class WhatsappCli < Formula
  desc "Command-line interface for WhatsApp using whatsmeow"
  homepage "https://github.com/vicentereig/whatsapp-cli"
  version "1.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-darwin-amd64.tar.gz"
      sha256 "04647174bccf38af4de4d3b0d2edef33ae2e8500a4e5f5088e55e5998f7be021"
    end
    on_arm do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-darwin-arm64.tar.gz"
      sha256 "619c53dba4e66d41adbab1d537d509fc669ccb699326d8c9651eb2f92dc4120e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-linux-amd64.tar.gz"
      sha256 "b8e36e3e8410a47f9eeb7c7d402c8237e8f9b475deea331d0ca443edaa9c0644"
    end
    on_arm do
      url "https://github.com/vicentereig/whatsapp-cli/releases/download/v#{version}/whatsapp-cli-linux-arm64.tar.gz"
      sha256 "f2ed11f502560949a63405be453ac394111e3420ebe0eb0a7869e610ad98e24a"
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
