# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.7.0/veto_0.7.0_darwin_amd64.tar.gz"
      sha256 "0ac1ca33149e648d1c8072c443a6f6acacfb955b16071341308598d918a5c18e"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.7.0/veto_0.7.0_darwin_arm64.tar.gz"
      sha256 "8eae3b36974bec47c83372b4b519eec5276f011683f07f86bdc64c7f93c35539"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.7.0/veto_0.7.0_linux_amd64.tar.gz"
      sha256 "7c1461a8a96bd9fc04a9e26f52a919286ad68dc7517431968864bdc6ad4d27cd"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.7.0/veto_0.7.0_linux_arm64.tar.gz"
      sha256 "0cd05db5cec5b583d3bcadeb3f0b952ab2643eeaa81e988dd103b121062574b6"

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
