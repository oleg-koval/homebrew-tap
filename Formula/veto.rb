# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.0/veto_0.6.0_darwin_amd64.tar.gz"
      sha256 "bab54d0ef81f2b4f1be8700ea5aa97b71da5379a25c31a63308c45358b5653ca"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.0/veto_0.6.0_darwin_arm64.tar.gz"
      sha256 "7a9d1055339b17d0b9b3015394fbe77c66937bea85b8bfbd921eb0900449bd34"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.0/veto_0.6.0_linux_amd64.tar.gz"
      sha256 "2364c99f8cc8e0eeb3f4551251590369ddfcf921e12dd1640e0e63e8d3c747d0"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.0/veto_0.6.0_linux_arm64.tar.gz"
      sha256 "f82bae147c58efeb8b8d37a8c8e1c979d14f7437e45d314f7ff6be7c2dd8612c"

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
