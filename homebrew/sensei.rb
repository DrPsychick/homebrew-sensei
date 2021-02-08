class sensei < Formula
  desc "A small macOS tool to read sensor information"
  homepage "https://github.com/DrPsychick/sensei"
  url "https://github.com/DrPsychick/sensei/archive/sensei-v0.0.1.tar.gz"
  sha256 "85cc828a96735bdafcf29eb6291ca91bac846579bcef7308536e0c875d6c81d7"
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
