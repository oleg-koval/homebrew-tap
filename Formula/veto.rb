# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.2.0/veto_0.2.0_darwin_amd64.tar.gz"
      sha256 "bc361e0a5937d216adc4bd6ec9100ac723cbadc329f83177c6ca028d492abb75"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.2.0/veto_0.2.0_darwin_arm64.tar.gz"
      sha256 "b5f390980f8bf999a9f0d1b0c565cbf85c0e7f635df9a69edac0ac71b5a9926d"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.2.0/veto_0.2.0_linux_amd64.tar.gz"
      sha256 "dfa7b4d7073421ee405fbfcebd97b7ba4c32745147289943e65db17ce6491699"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.2.0/veto_0.2.0_linux_arm64.tar.gz"
      sha256 "74f89214d5631a693964d9ade0be08695ff2a918ea8f408ce5b4d75ba99cc84f"

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
