# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.5.0/veto_0.5.0_darwin_amd64.tar.gz"
      sha256 "b9124e3b7f3bb5b54bea40434b1117feb2176be3d6061ab2c3cebf7f703e6b48"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.5.0/veto_0.5.0_darwin_arm64.tar.gz"
      sha256 "8b362a9ed18c0cf76d12802d628d6057e5fa344cad07de826979fd62c9e7b571"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.5.0/veto_0.5.0_linux_amd64.tar.gz"
      sha256 "fd5781fa0bdc5b64be41cd66b6ea309347a9240f0f2d80fb0eb68f165c5fb076"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.5.0/veto_0.5.0_linux_arm64.tar.gz"
      sha256 "fd990878333db51bdfb981df82a7db74664435e9bb6b050526dd4818c63cd57e"

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
