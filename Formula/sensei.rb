class Sensei < Formula
  desc "A small macOS tool to read sensor information"
  homepage "https://github.com/DrPsychick/homebrew-sensei"
  url "https://github.com/DrPsychick/homebrew-sensei/archive/v0.0.1.tar.gz"
  sha256 "f02b86158b3fa9beb4086c3d804a4815d3640d9aab97d475dfdae82e87bbfe19"
  license "GPL3"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on :xcode => "10.1"

  def install
    system "cmake", ".", "-GNinja", *std_cmake_args
    system "ninja", "install"
  end

  test do
    system "false"
  end
end
