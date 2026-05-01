class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.1.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.1.0/mac-onboarding-darwin-arm64"
    sha256 "7e49e8ee14a8d79843c9ab42775c2106e781fb305a8ae458df4eb3be776b9200"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.1.0/mac-onboarding-darwin-amd64"
    sha256 "f30a5bf05338bc2581e2ec32fc8218aa57b4b413e646450a2a32561c55ca592a"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
