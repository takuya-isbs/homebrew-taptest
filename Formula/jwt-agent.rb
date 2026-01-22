class JwtAgent < Formula
  desc "obtain a JSON Web Token (JWT) from a JWT server"
  homepage "https://github.com/oss-tsukuba/jwt-agent"

  v_num = "1.1.1"
  version v_num

  url "https://github.com/oss-tsukuba/jwt-agent/archive/refs/tags/#{v_num}.tar.gz"

  # shasum -a 256
  sha256 "7b3bb160e963feed83c63018c54056643cf6eb7510a431c15c931756ba5ce4cb"

  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/jwt-agent", "--version"
  end
end
