# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.11.0/veto_0.11.0_darwin_amd64.tar.gz"
      sha256 "7737e810a4b990c380c98c6b075c82b9075011f0a3328252c187f2fe25c59c22"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.11.0/veto_0.11.0_darwin_arm64.tar.gz"
      sha256 "5e8d00aa500217c6f39e1bac19813dfe51c309d3bd3dc2cfe944edc5dc4a5cee"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.11.0/veto_0.11.0_linux_amd64.tar.gz"
      sha256 "9ab0ad889647de498d8fbaf620e60b94be07ac171f4d13c1100b9bffb177da47"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.11.0/veto_0.11.0_linux_arm64.tar.gz"
      sha256 "6b58244f2a843e7e6a1b35876fba6ab4fc83658f7033d19fabbeafecdd5c030d"

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
