class TreCommand < Formula
  desc "Tree command, improved"
  homepage "https://github.com/dduan/tre"
  url "https://github.com/dduan/tre/archive/v0.3.4.tar.gz"
  sha256 "d4526efa37280ab2450c9595cf90b72d2fbf5fdeb989a3386f24297cb5da82fc"
  license "MIT"
  head "https://github.com/dduan/tre.git"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "4a3de40999d02154d60415f318533075ccf4170a918036bfe53c4659217e1c85"
    sha256 cellar: :any_skip_relocation, big_sur:       "980b7e58d8f8f34d6e5b5e8edc99f1f336173c25f4f0310e8922e098ef5758e4"
    sha256 cellar: :any_skip_relocation, catalina:      "bef95c814d73de29b1c9cc2e868191b86e9e1d1326c0a7c590dbbb45f159e060"
    sha256 cellar: :any_skip_relocation, mojave:        "56ffe7b2461747687c0caededfa6b3fd2094c1773744f3ea7660d6c6ce56f0c5"
    sha256 cellar: :any_skip_relocation, high_sierra:   "3c7d84087c637c80d13c29938d218ac442b841d1265552a6c383b28ad145204e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "manual/tre.1"
  end

  test do
    (testpath/"foo.txt").write("")
    assert_match("── foo.txt", shell_output("#{bin}/tre"))
  end
end
