class WaMigrate < Formula
  include Language::Python::Virtualenv

  desc "Transfer WhatsApp Business chats from Android to iPhone"
  homepage "https://github.com/lazzyms/WhatsApp-business-transfer"
  url "https://github.com/lazzyms/WhatsApp-business-transfer/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bc24fd6169eb74adc9191b087940bf1098d54f50a09277a5b3fe0392737b8253"
  license "GPL-3.0-or-later"

  depends_on "libimobiledevice"
  depends_on "python@3.13"

  resource "javaobj-py3" do
    url "https://files.pythonhosted.org/packages/6e/a4/a0140d76c62effc710aa180c657792236d10e43d3f993b71bafc3036fea1/javaobj_py3-0.6.1.tar.gz"
    sha256 "088ff086c6aa2912f342754c43b0ca3a504fb869bb5e6f13395131e87744ef3c"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/d8/a6/94e05400fc84f90f1c1476c23388bf2a3d5b8a5f88fdf1f45dc778ba4412/protobuf-5.27.5.tar.gz"
    sha256 "7fa81bc550201144a32f4478659da06e0b2ebe4d5303aacce9a202a1c3d5178d"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/f3/c2/f5855412372e47d635599a97c00cfcf9fc40accac9436a11bf9ded19f859/pycryptodomex-3.24.2.tar.gz"
    sha256 "e4dbc29e2575365d15e272f769329106277649aea081e2119cf43d66950f8f8f"
  end

  resource "wa-crypt-tools" do
    url "https://files.pythonhosted.org/packages/df/2d/305de9042be8b11bf3a1a1935d0aac6ee203dfa6ae7ab1f9ede44059cdeb/wa_crypt_tools-0.1.0.tar.gz"
    sha256 "13f93694ac650715039df6de10b1c18b7b0c2f74fe050277ccf1e1e211af889e"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Android backups are pulled with adb:
        brew install --cask android-platform-tools
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wa-migrate --version")
  end
end
