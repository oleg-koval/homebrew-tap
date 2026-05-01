class MacOnboarding < Formula
  desc "Export macOS configs and settings, install on a new Mac without Time Machine"
  homepage "https://github.com/oleg-koval/mac-onboarding"
  version "0.2.5"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.5/mac-onboarding-darwin-arm64"
    sha256 "05c0f2b6d7fe169b4e0e0845ac69e21dbef5280e367d64bd1a62e9de2e3bcc22"
  else
    url "https://github.com/oleg-koval/mac-onboarding/releases/download/v0.2.5/mac-onboarding-darwin-amd64"
    sha256 "df24ae4633e546547ce7d4376ea0aad55273a6612a3e1f125e4b4f18d964fa0d"
  end

  def install
    bin.install Dir.glob("mac-onboarding*").first => "mac-onboarding"
  end

  test do
    system "#{bin}/mac-onboarding", "--help"
  end
end
