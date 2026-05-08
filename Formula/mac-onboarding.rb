class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.10"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.10/mac-onboarding-darwin-arm64"
    sha256 "eced6e9c06de93c7166ee7f8889ec0f1c4b2ee3d6a15211281a05b4ff76fb5bb"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.10/mac-onboarding-darwin-amd64"
    sha256 "d281e8602b4efcac2c581e3e3b11c465f6302fdd62dd5f69fa5df88990a17711"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
