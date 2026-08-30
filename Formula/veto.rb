# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.3.0/veto_0.3.0_darwin_amd64.tar.gz"
      sha256 "033c9dede5b5b8d9888d4e0acffb978193c26d04649d60499abfc62e668822f5"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.3.0/veto_0.3.0_darwin_arm64.tar.gz"
      sha256 "c5b4ad51533f58efa1bf024f1e1373a43702e2c0383f4e82f7b1c1535540c81c"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.3.0/veto_0.3.0_linux_amd64.tar.gz"
      sha256 "b1009ef5573116b70dbac300aea7d963d365048b3e9cb367d960a6c569f66b28"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.3.0/veto_0.3.0_linux_arm64.tar.gz"
      sha256 "50670a86dca19d87f7ed6448bca963f09bf62168d792b9011807c2f53a8586de"

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
