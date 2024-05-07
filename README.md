# Flutter Soundboard

<p align="center">
<img align="center" src="https://user-images.githubusercontent.com/5732536/76313150-52c95c80-62cc-11ea-9cdc-4d272229aa5b.jpg" width="300" alt="screenshot">
<img align="center" src="https://user-images.githubusercontent.com/5732536/76313154-552bb680-62cc-11ea-9e41-f2e7499514d2.jpg" width="300" alt="screenshot during search">
</p>

A simple soundboard app, with:

 - Quotes laid out as a scrollable grid of captioned image tiles. Tapping on one plays the sound bite.
 - A search bar, allowing quotes to be filtered by their content and by other metadata such as the TV show they're from
 - 'Play random' floating action button, which will play a random quote of those returned by the current search
 - Ability to share a quote (e.g. to WhatsApp) by long-pressing on it

## Setup

This project uses [asdf](https://asdf-vm.com/) to manage the necessary tools. To get set up, run
(from the root of the repo):

```bash
./init-asdf.sh
```

This will prompt you to install asdf and set up the required plugins.
 
## Data entry

If you want to fork this project to make your own custom list of quotes, then you'll need:

 - Some audio clips that you want to play, in MP3 format
 - Images for the clips. 
     - At least one per 'source' of audio, but can add more if you want more granularity than that 
     - Must be square, at least 200x200 pixels in size and in PNG format.

## Audio normalisation

The app is a lot more user-friendly if you normalise the various audio clips, so they play at a similar volume. To do this, you can use the [normalize-audio](http://manpages.ubuntu.com/manpages/bionic/man1/normalize-audio.1.html) package:

```bash
./scripts/normalise-audio.sh
```

## Other tasks

 - To regenerate Mockito mock files (*.mocks.dart):

```bash
flutter pub run build_runner build && dart format --line-length 120 .
```

 - To run integration tests, start up an emulator and then run:

```bash
flutter test integration_test
```