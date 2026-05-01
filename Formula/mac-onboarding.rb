class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.3/mac-onboarding-darwin-arm64"
    sha256 "3381a539acdc9b547a2e25e6e8463fd328f37d6d82e4bf79c633beecf1d60397"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.3/mac-onboarding-darwin-amd64"
    sha256 "86eefa19b34c4dd8398d4fd92f9b6cb3dd39a69f1bbb6370abe173799866212e"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
