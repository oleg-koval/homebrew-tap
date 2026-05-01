class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.7"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.7/mac-onboarding-darwin-arm64"
    sha256 "e39114d4df6f7ad652dc8cc6b39046f2d0081d859d2105e376f56d064fad85fa"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.7/mac-onboarding-darwin-amd64"
    sha256 "3e9aa0094b079048c0a6e3ee23766266af92211e183a21127096d7cae2c74496"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
