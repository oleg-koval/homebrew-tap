class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.2/mac-onboarding-darwin-arm64"
    sha256 "46b708e21add3603085d759594033dd2944157f5dbe2292f55bf2fd8a9457f3e"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.2/mac-onboarding-darwin-amd64"
    sha256 "a4a5f68fda9f76111013cc9de927b789f17b451803ba51ae2a37fe11df640670"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
