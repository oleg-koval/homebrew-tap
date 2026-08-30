# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.1/veto_0.6.1_darwin_amd64.tar.gz"
      sha256 "0ddf7202c2471cf80d7fe8568c0c3af401203bda508423cdce142c4a445f0a89"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.1/veto_0.6.1_darwin_arm64.tar.gz"
      sha256 "a4bdb7e1a2f7b409451bd23bbb350ef321c6b8cd15a551dbde50e905b7ecea6e"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.1/veto_0.6.1_linux_amd64.tar.gz"
      sha256 "cfcb239adf24148b91230e7da86ec21501071649478fecafeba1f02faa06f6bf"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.1/veto_0.6.1_linux_arm64.tar.gz"
      sha256 "d434bbd8c5825e36101c7b0ec7ffe62fc6ab863d6c936fe680fd92e2f643d988"

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
