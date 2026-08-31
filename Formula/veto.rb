# typed: false
# frozen_string_literal: true

class Veto < Formula
  desc "Cost-aware AI model router with structured admission decisions"
  homepage "https://github.com/oleg-koval/veto"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.3/veto_0.6.3_darwin_amd64.tar.gz"
      sha256 "41ddf84d4ea03b17737e8ed1fc157eef6883343bfd1f4d32d3365fb8099519c1"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.3/veto_0.6.3_darwin_arm64.tar.gz"
      sha256 "7a7a6a22df57e0522cd057053ac38107f4d1d6f65808f734f2e53cbee4dace87"

      define_method(:install) do
        bin.install "veto"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.3/veto_0.6.3_linux_amd64.tar.gz"
      sha256 "acfce57791f6e2a4b10cdde9c871edd6c67afec2bc969cf02b25b85c3496e155"

      define_method(:install) do
        bin.install "veto"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/oleg-koval/veto/releases/download/v0.6.3/veto_0.6.3_linux_arm64.tar.gz"
      sha256 "fdca3abb5329b2af3c0fbf0537af623b9c36a6a86bb1efa5c4d3625b0c0886b3"

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
