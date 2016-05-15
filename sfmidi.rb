require "formula"

class Sfmidi < Formula
  homepage ""
  url "http://www.zorexxlkl.com/files/downloads/sfMidi-1.1.0-CMake.zip"
  sha256 "2ba1de398e51c81e3178f8f075bda0119596a0fb227ff62d6633d3928a406522"

  depends_on "cmake" => :build
  depends_on "sfml" => :build
  depends_on "fluidsynth" => :build

  def install
    # Include Error.h among installed header files
    system '/usr/local/bin/gsed -i -e "s/.*Loader.h.*/\${INCSFMIDI}\/Loader.h\\n\${INCSFMIDI}\/Error.h/" CMakeLists.txt'
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/program"
  end
end
