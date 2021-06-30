# 3D Soundscapes

## Initial Idea

The initial idea was to represent a human's presence inside a forest, surrounded by several types of animals (birds, boars, deers, bears, bees and other types of insects).
We decided to bring up the first work from the classes and develop and improve it in order to create a 3D Soundscape Composition. 

## Objectives

- Develop a 3D Soundscape for headphones and the 8 speaker layout configured at the FEUP's CSM Lab.
- Encode sound for ambisonics;
- Apply binaural and ambisonics decoders;
- Apply OmniCompressor to prevent the MASTER's volume from passing the 0dB and losing quality.

## Composition Development

We decided to use the wind as the main keynote, as we did with the "Tessa: The Huntress" game soundscapes. From that, we added the animals' sounds, using a Stereo Encoder to make the soundscape feel more realistic and following a set of images representing the forest's wildlife. To take more advantage of the 3D space, we recreated a boar chasing a person by both running around at a small distance from each other. 

Since we already had assets for a river, we thought that it would be interesting to add it to our soundscape, since a lot of forests have rivers, lakes and waterfalls. The river was divided mainly into two parts: the listener goes towards the river; then it enters it and stays inside it. These two parts can be distinguished by the river sound's volume and position. Initially, the listener hears the river in front of him, and then the sound surrounds him. Finally, we added fishes moving around and jumping off the water, frogs croaking and waterdrops falling from trees.

After achieving, in our opinion, a good result, we decided to take it further by adding one more layer to the river's part of the soundscape. Around the 3rd minute, you can sense the listener going underwater and continuing to hear the same sounds as before in that perspective. Then, the listener returns to an afloat position (still inside the water, but not underwater) and the soundscape finishes that way. The underwater result was achieved by applying a low pass filter, from the Multi Equalizer to the entire soundscape.

## Packages needed

The required packages are:
- [IEM Plug-in Suite](https://plugins.iem.at/)
- [Ambisonic Toolkit (ATK for Reaper)](https://www.ambisonictoolkit.net/)

If you haven't installed the packages yet, Reaper will show a pop-up window with a warning and a list of missing packages. Just install the missing packages. 

## Final Result

We rendered two different files: one binaural, that you can listen to using headphones; and one for ambisonics, with 8 channels.

- [Binaural](https://drive.google.com/file/d/1dRjI_QstRiakqaa3oej8EeUY_DMSNJ5C/view?usp=sharing)
- [Ambisonics](https://drive.google.com/file/d/1tkZOjHO-lxrgmqZeB2hUXCIxmICNFiLc/view?usp=sharing)
