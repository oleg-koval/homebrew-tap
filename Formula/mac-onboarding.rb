class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.9"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.9/mac-onboarding-darwin-arm64"
    sha256 "983dc5ee6f14b61466434a3d9c28bdd79c50939ea90bbef97b41b359f91a50ac"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.9/mac-onboarding-darwin-amd64"
    sha256 "2f6e45f8e994dd96f1a4fff96a0025e3d00bdd247ad41149e0f1cb92964c1ddc"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
