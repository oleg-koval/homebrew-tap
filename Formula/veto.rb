# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.9.0/veto_0.9.0_darwin_amd64.tar.gz"
      sha256 "4dfb4b216bcd50d81c559d5cbb13201625a023b48a543c9816ed6988fed93fe0"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.9.0/veto_0.9.0_darwin_arm64.tar.gz"
      sha256 "6c2026fa0e986b7983d49c107085b17f973f0495fef836f4c8f1953aaef2d312"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.9.0/veto_0.9.0_linux_amd64.tar.gz"
      sha256 "4459eadedead88dd7b4f892b4ac5af96a2f8721e420cae1593aa1bd6d9cd0e4d"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.9.0/veto_0.9.0_linux_arm64.tar.gz"
      sha256 "f6437a766409e1fc730a2d72cf8b841f8bf013872faf12f25f3ece71eceb5fa2"

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
