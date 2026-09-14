# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.12.0/veto_0.12.0_darwin_amd64.tar.gz"
      sha256 "de81cc76d732b3483a6eed3983139859bd1f8d229acc97db0d45cdfe1c6e8c88"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.12.0/veto_0.12.0_darwin_arm64.tar.gz"
      sha256 "d7b5e56644c66e87047c7d1a1f18ec0f2385bd94da53e1ed399d83fd561e466e"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.12.0/veto_0.12.0_linux_amd64.tar.gz"
      sha256 "4ba77239711a5ac1fe531029b7133aef4263ab7a2fc3d449a42ebc09b37b31a1"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.12.0/veto_0.12.0_linux_arm64.tar.gz"
      sha256 "d9d39ad4deee79bcf4b9112bf77d8c54020acf46e3cf6d14588de32a17a0a73f"

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
