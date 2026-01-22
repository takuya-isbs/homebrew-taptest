class JwtAgent < Formula
  desc "Obtain a JSON Web Token (JWT) from a JWT server"
  homepage "https://github.com/oss-tsukuba/jwt-agent"

  url "https://github.com/oss-tsukuba/jwt-agent/archive/refs/tags/1.1.1.tar.gz"
  # shasum -a 256
  sha256 "7b3bb160e963feed83c63018c54056643cf6eb7510a431c15c931756ba5ce4cb"

  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/takuya-isbs/homebrew-taptest/releases/download/jwt-agent-1.1.1"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e11669f7ad062375f1acecb3aaecddd3a327df5850fb470c9e4917e72bded62f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4a9e7a9047f6008d6a3f983425a561953cb05ae6060ba475bc855d6416e2d823"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "32b70098430440f1e085545ad4a9985c838eb44ffced0385f7e473f42c1b9575"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5565d3b8b65a222a0029989e40a57b13f939bdc207a045b921551d4d49b95d24"
  end

  depends_on "go" => :build

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}", "MANDIR=#{man}"
  end

  test do
    system "#{bin}/jwt-agent", "--version"
  end
end
