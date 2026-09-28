# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.15.0/veto_0.15.0_darwin_amd64.tar.gz"
      sha256 "ab79072d688a3392e9f8ab0ff753437d3db71d1eb90a23e7323658644f9f7df3"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.15.0/veto_0.15.0_darwin_arm64.tar.gz"
      sha256 "4fb039d975ef4c0f3774da54f47365e4d8d78998160b39dac5788bababd31a45"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.15.0/veto_0.15.0_linux_amd64.tar.gz"
      sha256 "ef68b973e46a8e23d41838551a3864f1af0fa05200a9a818a1ebc996b998adae"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.15.0/veto_0.15.0_linux_arm64.tar.gz"
      sha256 "99c1638194d6253a7bc0939b82da618b8f6c641495113fa535911d63b01d02f8"

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
