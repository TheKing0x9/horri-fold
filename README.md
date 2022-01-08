# Horri-Fold

A port of [Horri-Fi](https://gizmo199.itch.io/horri-fi) shader to Defold.
Horri-Fold is a Lo-Fi Horror Shader with support for seven different effects:

-Scanlines -Noise -VHS distortion -Bloom -Vignette -Chromatic abberation -CRT TV curve
---

## Installation
You can use the orthograpic camera in your own project by adding this project as
a [Defold library dependency](http://www.defold.com/manuals/libraries/).
Open your game.project file and in the dependencies field under project add:

https://github.com/TheKing0x9/horri-fold/archive/master.zip

Or point to the ZIP file of a [specific release](https://github.com/TheKing0x9/horri-fold/releases).

## Quick Start
Getting started with Horri-Fold is easy:

1. Add `quad.go` to your game.
2. Open `game.project` and make sure to reference `horri-fold/postprocess.render`
in the `Render` field in the `Bootstrap` section.
3. Also in the `Dependencies` field in the `Project` section, add [Defold Orthographic](https://github.com/britzl/defold-orthographic)
as a dependency.

## Documentation

### Horri-Fold Script
The following properties are exposed via the Horri-Fold script.

  - **Enable Bloom** : Enables the bloom effect.
  - **Bloom Radius** : The Radius of bloom effect.
  - **Bloom Intensity** : The Brightness of the bloom effect. Should be between `0` and `1`.
  - **Bloom Threshold** : Provies a cutoff value for the `Bloom Radius` property.
  Should be between `0` and `1`.

  - **Enable Chromatic Abberation** : Enables the chromatic abbration effect.
  - **Chromatic Strength** : Controls the strength of chromatic abberation.
  Should be between `0` and `1`.

  - **Enable Vignette** : Enables the vignette effect
  - **Vignette Strength** : Controls the brightness of non-vignetted areas.
  Should be between `0` and `1`.
  - **Vignette Intensity** : The curvature of vignette effect.
  Should be between `0` and `1`.

  - **Enable Noise** : Enables a noise-effect, like those seen in old TVs.
  - **Noise Strength** : Controls the strength of noise effect.
  Should be between `0` and `1`.

  - **Enable VHS Distortion** : Enables VHS Distortion effect.
  - **Distortion Strength** : Controls the strength of Distortion effect.
  Should be between `0` and `1`.

  - **Enable Scanlines** : Enables scanlines.
  - **Scanlines Strength** : The density of scanlines.
  Should be between `0` and `1`.

  - **Enable CRT** : Enables the CRT TV curve effect.
  - **CRT Curve** : The screen curvature. Should be between `0` and `1`.

### Custom Render Script/Camera Integration
While the in-built render script depends on `Defold Orthographic` to work,
Horri-Fold can be customized to be used alongside any render script.

> More Documentation on this coming soon.

## Known Bugs

Due to my limited GLSL knowledge, Bloom has not yet been implemented in the shader.

## License
Both Horri-Fold and Horri-Fi shaders are licensed under the MIT license.
The demo assets are licensed under CC0 license.

## Credits

  - Thanks to [gizmo199](https://gizmo199.itch.io) for the Horri-Fi Shader.
  - Improvements to the crt code were taken from [Godot Shaders](https://godotshaders.com/shader/vhs-and-crt-monitor-effect/)
  - The art in the demo is based on an asset pack by [Ansimuz](Ansimuz.itch.io)
  - The music in the demo is from [Outro Party Music by Buffy](https://opengameart.org/content/outro-party-music).
---
