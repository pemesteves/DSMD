# Mini-Project: Electric Car

The students should propose a real-time adapting sound for almost noiseless modern electric cars (or other similar technologies that imply auditory displays)

It should incorporate details about its aesthetics, concept, logic, and pertinence (safety, auditory displays) but also a possible Interface, Interaction, and sound generator structure

## Packages needed

- [Lokasenna_GUI v2](https://github.com/jalovatt/Lokasenna_GUI):
  - We've made some changes to this package so that we can take more advantage of the Button class

## How to Install

1. Download and Install REAPER (v6.29 recommended)
2. Download and Install ReaPack from [reapack.com](https://reapack.com)
3. Open Reaper. Now you can see a tab called Extensions with an option Reapack inside.
4. Go to Extensions > Reapack > Browse packages...
5. Search GUI and install the following two packages (select both, right-click and install):
   - Lokasenna's GUI library v2 for Lua
   - Lokasenna's GUI library v2 for Lua (developer tools)
6. After install the packages run the following script and copy the returned path:
   - Set Lokasenna_GUI v2 library path.lua
7. Go to the path returned by the previous command
8. Download [Lokasenna_GUI version from pemesteves](https://github.com/pemesteves/Lokasenna_GUI). There are two ways to do that:
   - If you have git installed, you can just clone the repository
   - The other way is to simply download the code zip and unzip it
9. Change the installed Lokasenna_GUI folder for pemesteves' version
10. Finally, just go to Actions > Show Action List > New action... > Load ReaScript, and load the car.lua file under the Scripts folder

## How to Test

As said before, you need to go to Actions > Show Action List > New action... > Load ReaScript, and load the car.lua file under the Scripts folder.

Then, run the car.lua action.

You'll see a UI panel that simulates a car (it has an accelerator and a brake, and a velocity slider).

To test the car sound, you need to select the only envelope armed (the Tone Gate frequency envelope) and then select Get Envelope in the UI. After that, you can play with the accelerator and the brake to simulate the car's movement. If you want to set the maximum and minimum values for the output sound's frequency there is also a slider that allows you to do it.

We think that the best values are the default ones, but you can change them between 20Hz and 400Hz (the minimum and maximum values of the Tone Gate plugin).

You can also use OSC to control the car's velocity instead of the pedals.

## Using OSC

To use OSC, you need to toggle the "Use OSC" option (press Yes to do that).
Be aware that, for the OSC to work as intended, you should let the car's velocity reach 0 before activating it. The same thing should be taken into consideration if you disable the OSC option. Otherwise, there might be some problems with the final result.

The selected enveloped can receive commands from /orientation.

We advise you to use oschook v2 since that was the app we used to test it. Using this app, you should use the following settings on Orientation:

- Send OSC: check
- Smoothing steps: 1
- Data range: 0.0 10.0
- Output range: 0.01 0.09
- OSC addresses:
  - alpha: empty
  - beta: /orientation
  - gamma: empty

WARNING: These are the settings for a Samsung Galaxy S8. Different phones can react differently to these settings.
