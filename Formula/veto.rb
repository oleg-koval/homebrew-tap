# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.17.0/veto_0.17.0_darwin_amd64.tar.gz"
      sha256 "7018f85f5c93d0531544b0c2d738b6c1b5cedb49a403b8fe1f0a2e024c22dd4c"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.17.0/veto_0.17.0_darwin_arm64.tar.gz"
      sha256 "e21c0c223066dfd299f95dc1e4978c2de997376a80eff79a7c21b91c7206ca50"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.17.0/veto_0.17.0_linux_amd64.tar.gz"
      sha256 "157df82fe25d33a549afae37c18323d667fd3220ade6cd443d3a783b3e6521d2"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.17.0/veto_0.17.0_linux_arm64.tar.gz"
      sha256 "f57590201729eeb32dda5a942af8e2412d124898f526f7cba98ffb626eddd32b"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  def post_install
    return unless OS.mac?

    executable = bin/"veto"
    return unless quiet_system "/usr/bin/xattr", "-p", "com.apple.quarantine", executable

    executable.chmod 0755
    system "/usr/bin/xattr", "-d", "com.apple.quarantine", executable
    executable.chmod 0555
  end

  test do
    assert_match "veto #{version}", shell_output("#{bin}/veto version")
  end
end
