class Modelgen < Formula
  desc "Generate 3D models (GLB, USDZ) from a CLI or an MCP server"
  homepage "https://github.com/Guilospanck/modelgen"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.3.0/modelgen-0.3.0-darwin-arm64.tar.gz"
      sha256 "88fc0f9f9c447956f9784494eefe34c5abe7641f62bc970df71140ffc5d9baca"
    end
    on_intel do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.3.0/modelgen-0.3.0-darwin-x64.tar.gz"
      sha256 "941e487a6d7c7d36dc48911367ea960436c8e1e21f20d49fd257ca9c3b1520fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.3.0/modelgen-0.3.0-linux-arm64.tar.gz"
      sha256 "87be1c27500cd2fba8295efed19e222d784d2055ce3af36a035968d7627bdb33"
    end
    on_intel do
      url "https://github.com/Guilospanck/modelgen/releases/download/v0.3.0/modelgen-0.3.0-linux-x64.tar.gz"
      sha256 "02a001f316398a8f1c53ba3dbe3ddddabff9f4b64edd2f7000d419257f0d8ca8"
    end
  end

  def install
    bin.install "modelgen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modelgen --version")
  end
end
