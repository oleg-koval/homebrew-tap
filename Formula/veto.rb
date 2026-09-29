# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.17.1/veto_0.17.1_darwin_amd64.tar.gz"
      sha256 "fa7cff3a36b510782e889ad919d67598b8c0450f4c18129e9cab6bd881d26152"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.17.1/veto_0.17.1_darwin_arm64.tar.gz"
      sha256 "ad8393220d57674574faa1a4f44653c1533dce6a9407e3e165d71f7d88eb79d8"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.17.1/veto_0.17.1_linux_amd64.tar.gz"
      sha256 "466cecc27ad26a31c912c48f28f59c95d325737376bbadb9312167d281a9297e"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.17.1/veto_0.17.1_linux_arm64.tar.gz"
      sha256 "5fdb234aa1bf9214699f304bc24968acc1ac8d346f8cb4ca08ed02c89fab6f2f"

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
