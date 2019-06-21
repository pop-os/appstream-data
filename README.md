# appstream-data

Additional appstream data for Pop!_OS

### Building

Execute the `build.sh` script to re-generate the `dest` folder.

Once built, Debian packaging may be created with the `debuild` command.

Use `dch` to update the debian/changelog.

### Testing

Execute these commands to test any changes:

```sh
kill $(pidof io.elementary.appcenter)
rm -r ./dest/*
yes | bash build.sh
debuild
sudo dpkg -i ../appstream-data*.deb
 ```
