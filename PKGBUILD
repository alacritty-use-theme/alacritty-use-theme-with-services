# Maintainer: Your Name <mca.christopher@gmail.com>
pkgname=great-matcha
pkgver=r24.b25c5c3
pkgrel=1
pkgdesc="Systemd units checks if dayNight for location. Updates alacritty theme"
arch=('x86_64')
url="https://github.com/christophermca/great-matcha"
license=('GPL')
depends=('redshift' 'awk' 'bash' 'alacritty-use-theme')
makedepends=('git')
source=("git+https://github.com/christophermca/great-matcha.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
  # systemd units
  install -Dm755 $srcdir/$pkgname/app/home/.config/systemd/user/color-mode.service "$pkgdir/home/$USER/.config/systemd/user/color-mode.service"
  install -Dm755 $srcdir/$pkgname/app/home/.config/systemd/user/theme-switcher.service "$pkgdir/home/$USER/.config/systemd/user/theme-switcher.service"
  install -Dm755 $srcdir/$pkgname/app/home/.config/systemd/user/theme-switcher.target "$pkgdir/home/$USER/.config/systemd/user/theme-switcher.target"
  install -Dm755 $srcdir/$pkgname/app/home/.config/systemd/user/theme-switcher.timer "$pkgdir/home/$USER/.config/systemd/user/theme-switcher.timer"
  install -Dm755 $srcdir/$pkgname/app/home/.config/systemd/user/update-gtk-theme.service "$pkgdir/home/$USER/.config/systemd/user/update-gtk-theme.service"

  install -Dm755 $srcdir/$pkgname/app/home/.config/theme-switcher/environment.env "$pkgdir/home/$USER/.config/theme-switcher/environment.env"
  install -Dm755 $srcdir/$pkgname/app/home/.config/theme-switcher/mode "$pkgdir/home/$USER/.config/theme-switcher/mode"

  install -Dm755 $srcdir/$pkgname/app/home/.local/theme-switcher/theme-switcher.sh "$pkgdir/home/$USER/.local/theme-switcher/theme-switcher.sh"
  install -Dm755 $srcdir/$pkgname/app/home/.local/theme-switcher/bin/get-sunrise-sunset.sh "$pkgdir/home/$USER/.local/theme-switcher/bin/get-sunrise-sunset.sh"
  install -Dm755 $srcdir/$pkgname/app/home/.local/theme-switcher/bin/update-gdm.sh "$pkgdir/home/$USER/.local/theme-switcher/bin/update-gdm.sh"
  install -Dm755 $srcdir/$pkgname/app/home/.local/theme-switcher/src/shared-variables.sh "$pkgdir/home/$USER/.local/theme-switcher/src/shared-variables.sh"

  install -Dm755 $srcdir/$pkgname/app/home/.local/share/theme-switcher/toggle-theme-per-mode.sh "$pkgdir/home/$USER/.local/share/theme-switcher/toggle-theme-per-mode.sh"

}
