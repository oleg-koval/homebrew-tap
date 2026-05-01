class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.6"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.6/mac-onboarding-darwin-arm64"
    sha256 "a7ebfdfa50faa19ef2899b4e2e03c9cafdc9e8dd63b4b792270d2c9fddf5fbec"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.6/mac-onboarding-darwin-amd64"
    sha256 "561c49a1c0444adfa499b3032989b36738938369d6836b19df4264cba71f00a0"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
