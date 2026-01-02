# Maintainer: Your Name <mca.christopher@gmail.com>
pkgname=great-matcha
pkgver=r22.34a094c
pkgrel=1
pkgdesc="Systemd units checks if dayNight for location. Updates alacritty theme"
arch=('x86_64')
url="great-matcha::https://github.com/christophermca/great-matcha"
license=('GPL')
depends=('redshift' 'awk' 'bash')
makedepends=('git')
source=("git+https://github.com/christophermca/great-matcha.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
}
