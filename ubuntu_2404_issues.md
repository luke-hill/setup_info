## LibFFI with ffi gem
```
$ gem uninstall ffi
$ gem install ffi
```

## VPN
Openvpn3 needs new apt source - https://github.com/OpenVPN/openvpn3-linux/issues/253

## DEV Apt Package issues

- `libappindicator1` doesn't exist
- `gnome-tweaks` is the new name for `gnome-tweak-tool`
- `libcurl3t64-gnutls` instead of `libcurl3-gnutls`
- Note, selecting `'libcurl4t64'` instead of `'libcurl4'`
- `awscli` doesn't exist
- `pinta` doesn't exist
- Change `openjdk-11-jdk` for `openjdk-21-jdk`
  
## RVM issues
Downgrade the version of libssl `sudo apt install libssl-dev=1.1.1l-1ubuntu1.4`

The above doesn't fully work to them install Ruby 3.0 and below. So try the following instead

https://deanpcmad.com/2024/installing-older-ruby-versions-on-ubuntu-24-04-and-22-04/
