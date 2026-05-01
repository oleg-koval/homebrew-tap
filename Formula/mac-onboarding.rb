class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.1/mac-onboarding-darwin-arm64"
    sha256 "4e572c9068a4b1ec2b1630cad5e8d908e3ceae47b11935630f68b3fde5321348"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.1/mac-onboarding-darwin-amd64"
    sha256 "7acfc861fb028ab644d07be1b115c168587afded57f803e3cab5a0a188e86efe"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
