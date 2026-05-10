class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.11"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.11/mac-onboarding-darwin-arm64"
    sha256 "4cba2f9a45453605b33dac69b1b4df56eae3391e8c75757d95c02025a78f4f44"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.11/mac-onboarding-darwin-amd64"
    sha256 "2a8753149316624228640d060ad9a8fa45105e5e2c186947fdcd9959ca29d79a"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
