class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.4/mac-onboarding-darwin-arm64"
    sha256 "5432181538e580b5873ba3416e74731cb757ba2cf4f7ec69e22337aba551eea1"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.4/mac-onboarding-darwin-amd64"
    sha256 "abbfe658d9edf48a0685e9f759964639f8a0c611451495e212d63bee540b71d1"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
